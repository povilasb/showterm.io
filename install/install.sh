#!/bin/sh

# Debian packages neccessary for Showterm.io to run.
PACKAGES="mysql-server ruby2.0 ruby2.0-dev gcc libc6-dev nodejs \
	libmysqlclient-dev"
APT_UNSTABLE="deb ftp://ftp.debian.org/debian/ unstable main contrib non-free"
RUBY_GEM=gem2.0


# Make shell print the executing commands.
set -x

# 1. Update apt with unstable packages.
sudo echo "${APT_UNSTABLE}" > /etc/apt/sources.list.d/unstable.list
sudo apt-get update

# 2. Get debian packages.
sudo apt-get install ${PACKAGES}

# 3. Install neccessary ruby gems.
${RUBY_GEM} install bundler mysql2

# 4. Create mysql user and database for showterm.
mysql --user root --password < mysql_init.sql
