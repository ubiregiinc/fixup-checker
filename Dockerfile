FROM ssig33/ruby-imagemagick-groonga
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle -j9
CMD foreman start
