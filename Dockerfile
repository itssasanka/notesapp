FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

# for postgrdockeres, not required for now.
# RUN apt-get install -y libpq-dev
# for nokogiri, not required for now.
# RUN apt-get install -y libxml2-dev libxslt1-dev
# for a JS runtime, not required for now.
# RUN apt-get install -y nodejs

ENV APP_HOME /testapp
ENV BUNDLE_PATH /bundle

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

RUN gem install bundler
RUN bundle install