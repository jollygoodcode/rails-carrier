#!/usr/bin/env bash

sudo update-locale LC_ALL="en_US.utf8"

# https://www.brightbox.com/docs/ruby/ubuntu/#installation
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:brightbox/ruby-ng

# PostgreSQL 9.4 http://www.postgresql.org/download/linux/ubuntu/
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# update & upgrade existing packages
sudo apt-get update
sudo apt-get upgrade -y

# install packages
sudo apt-get install -y build-essential
sudo apt-get install -y curl
sudo apt-get install -y ruby2.2 ruby2.2-dev
sudo apt-get install -y git-core
sudo apt-get install -y sqlite3 libsqlite3-dev
sudo apt-get install -y redis-server memcached
sudo apt-get install -y imagemagick
sudo apt-get install -y libxml2 libxml2-dev libxslt1-dev
sudo apt-get install -y nodejs
sudo apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev python-software-properties libffi-dev libksba8 libksba-dev

# Testing
sudo apt-get install -y phantomjs

# PostgreSQL
sudo apt-get install -y postgresql-9.4 postgresql-contrib-9.4 libpq-dev
sudo su postgres -c "createuser -d -S vagrant"

gem update --system 2.4.5.1
sudo sh -c 'echo "gem: --no-document" > ~/.gemrc'
gem install bundler rake
gem install rails
