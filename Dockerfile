FROM ruby:2.4.0-slim

ENV RAILS_ENV production

RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile* /myapp/
ADD . /myapp
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs \
  && bundle install

EXPOSE 3000

ENTRYPOINT ["bundle", "exec", "puma", "-C", "config/puma.rb" ]
