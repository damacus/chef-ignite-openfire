name             "openfire"
maintainer       "Gavin Montague"
maintainer_email "gavin@leftbrained.co.uk"
license          "Apache 2.0"
description      "Installs Openfire Jabber server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url       'https://github.com/computerlyrik/chef-openfire'
issues_url       'https://github.com/computerlyrik/chef-openfire/issues'

version          "0.2.1"
supports         "ubuntu"
supports         "centos"
supports         "debian"

depends "java"
depends "database"
depends "postgresql"
