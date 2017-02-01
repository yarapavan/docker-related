#!/bin/bash -ex

apt-get -y update
apt-get -y install software-properties-common apt-transport-https wget git sudo libmysqlclient-dev

# Maven
apt-get -y install maven

# npm
apt-get -y install curl
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get -y install nodejs

# Postgres
add-apt-repository "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get -y update
apt-get -y install postgresql-9.5 postgresql-client-9.5
cp pg_hba.conf /etc/postgresql/9.5/main/
/etc/init.d/postgresql start
sudo -u postgres createuser -s digdag_test
sudo -u postgres createdb -O digdag_test digdag_test

# Python
apt-get -y install python python-pip python-dev
pip install pip --upgrade
# Using sphinx==1.4.9 because sphinx_rtd_theme with sphinx 1.5.x has a problem with search and its fix is not released: https://github.com/snide/sphinx_rtd_theme/pull/346
pip install sphinx==1.4.9 recommonmark sphinx_rtd_theme Jinja2==2.9.4 Mako==1.0.6 MarkupSafe==0.23 MySQL-python==1.2.5 PyYAML==3.12 SQLAlchemy==1.1.4 alembic==0.8.9 argparse==1.2.1 boto==2.43.0 chardet==2.3.0 datadog==0.14.0 dataset==0.7.1 decorator==4.0.10 elasticsearch==2.3.0 futures==3.0.5 httplib2==0.9.2 normality==0.3.9 python-editor==1.0.3 requests==2.11.1 sendgrid==1.6.22 simplejson==3.10.0 six==1.10.0 smtpapi==0.3.1 urllib3==1.19 wsgiref==0.1.2


rm -rf /var/lib/apt/lists/*
