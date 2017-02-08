FROM ruby:2.4.0-slim
MAINTAINER rodrigo.dealer@gmail.com

ENV RAILS_ENV production

WORKDIR /myapp
ADD . /myapp
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev nodejs \
  && bundle install  --without development test && bundle exec rake assets:precompile

EXPOSE 3000

ENTRYPOINT ["bundle", "exec", "puma", "-C", "config/puma.rb" ]
