FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y postgresql-client sudo
RUN curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

CMD ["rails", "server", "-b", "0.0.0.0"]
