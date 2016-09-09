group node['openfire']['group']

user node['openfire']['user'] do
  group node['openfire']['group']
end

directory node['openfire']['log_dir'] do
  user node['openfire']['user']
  group node['openfire']['group']
  recursive true
end

if ubuntu?
  include_recipe 'apt'
  package 'default-jre-headless'
end

if rhel?
  include_recipe 'java'
end

template '/etc/sysconfig/openfire' do
  mode '0644'
  source 'openfire.erb'
  variables(
    user: node['openfire']['user'],
    pid_file: '/var/run/openfire.pid',
    home_dir: node['openfire']['home_dir'],
    log_dir: node['openfire']['log_dir'],
    java_home: node['java']['java_home']
  )
end
