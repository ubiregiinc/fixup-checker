FROM ruby:3.3.1

RUN apt-get update -qq && \
  apt-get install -y build-essential

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler --version=2.5.9 && \
  bundle config set --local without "$BUNDLE_WITHOUT" && \
  bundle install -j9

COPY . .
