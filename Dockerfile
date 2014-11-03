FROM ubuntu:14.04

ENV RAILS_ENV production

RUN apt-get update -q
RUN apt-get install -qy python-software-properties software-properties-common
RUN add-apt-repository -y ppa:brightbox/ruby-ng
RUN apt-get update -q
RUN apt-get install -qy nginx ruby2.1 ruby2.1-dev nodejs sqlite3 libsqlite3-dev zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev git-core curl libpq-dev

RUN mkdir -p /var/www

RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

WORKDIR /tmp
ADD Gemfile      Gemfile
ADD Gemfile.lock Gemfile.lock
RUN /bin/bash -l -c "bundle install"

# Add application source
ADD . /var/www
WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT bin/start_server.sh

