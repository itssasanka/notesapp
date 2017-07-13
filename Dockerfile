FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /notesapp
ENV BUNDLE_PATH /notesapp_bundle

RUN mkdir $BUNDLE_PATH
WORKDIR $APP_HOME
ADD . $APP_HOME
