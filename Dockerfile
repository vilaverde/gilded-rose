FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /gilded-rose-app

WORKDIR /gilded-rose-app

ADD Gemfile /gilded-rose-app/Gemfile

ADD Gemfile.lock /gilded-rose-app/Gemfile.lock

RUN gem install bundler

RUN bundle install

ADD . /gilded-rose-app
