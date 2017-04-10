FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /notesapp
ENV BUNDLE_PATH vendor/bundle

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

RUN gem install bundler
RUN bundle install
