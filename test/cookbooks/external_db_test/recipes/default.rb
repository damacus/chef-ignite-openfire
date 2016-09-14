node.default['openfire']['config']['database']['type'] = 'external' # By default use internal database

include_recipe 'postgresql::server'
include_recipe 'ignite-openfire'
