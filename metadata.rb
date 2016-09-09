name             'ignite-openfire'
maintainer       'Dan Webb'
maintainer_email 'dan.webb@damacus.io'
license          'Apache 2.0'
description      'Installs Openfire Jabber server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url       'https://github.com/damacus/chef-openfire'
issues_url       'https://github.com/damacus/chef-openfire/issues'

version          '0.1.0'
supports         'centos'
supports         'windows'

depends 'java'
depends 'database'
depends 'postgresql'
depends 'chef-sugar'
depends 'apt'
