require "bundler"
Bundler.require
require "json"

def process_pull_request pull_request
  client = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  flag = false
  client.pull_request_commits(pull_request['base']['repo']['full_name'], pull_request["number"]).map{|x| x[:commit][:message] }.each do |m|
    if m =~ /^fixup!|^squash!/
      flag = true
      break
    end
  end
  if flag
    client.create_status(pull_request['base']['repo']['full_name'], pull_request['head']['sha'], 'failure', description: "This pull request is containing fixup! commit. Please rebase it before merge.", context: "fixup!")
  else
    client.create_status(pull_request['base']['repo']['full_name'], pull_request['head']['sha'], 'success', description: "Commit Logs are Clean!", context: "fixup!")
  end
end

post "/check" do
  payload = JSON.parse(params[:payload])

  p payload.keys
  p payload

  if payload["action"] == "synchronize" or (payload["pull_request"] and payload["pull_request"]["number"])
    process_pull_request(payload["pull_request"])
  end
  "OK"
end
