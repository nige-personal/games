FROM ruby:2.5

ARG APP_DIR
ENV APP_DIR $APP_DIR

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /$APP_DIR
WORKDIR /$APP_DIR
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /$APP_DIR

ARG COMMAND
ENV COMMAND ${COMMAND}

EXPOSE 3000
CMD bash -c "${COMMAND}"
