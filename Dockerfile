FROM ruby:3.0.0

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs

RUN node -v
RUN npm -v

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.2.3
RUN bundle install --jobs 20 --retry 5

RUN npm install -g yarn
RUN yarn install --check-files

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
