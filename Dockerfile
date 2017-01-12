FROM ruby:2.4.0-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

EXPOSE 3000

ENV RAILS_ENV production

ENTRYPOINT ["bundle", "exec", "puma", "-C", "config/puma.rb" ]
