#!/bin/sh

# Debian packages neccessary for Showterm.io to run.
PACKAGES="postgresql-9.1 postgresql-server-dev-9.1 ruby2.0 ruby2.0-dev gcc \
	libc6-dev nodejs"
APT_UNSTABLE="deb ftp://ftp.debian.org/debian/ unstable main contrib non-free"
RUBY_GEM=gem2.0


# Make shell print the executing commands.
set -x

# 1. Update apt with unstable packages.
sudo echo "${APT_UNSTABLE}" > /etc/apt/sources.list.d/unstable.list
sudo apt-get update

# 2. Get debian packages.
sudo apt-get install ${PACKAGES}

# 3. Install ruby gems.
${RUBY_GEM} install bundle
bundle install

# TODO: create postgresql database and user for showterm.

# 3. Setup rails db.
rake2.0 db:setup
