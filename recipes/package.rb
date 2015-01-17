include_recipe "java"

case node['platform_family']
when 'rhel'
  source_file = "openfire/openfire-#{node['openfire']['version']}-1.i386.rpm"
  local_package_path = "#{Chef::Config['file_cache_path']}/openfire.rpm"
when 'debian'
  source_file = "openfire/openfire_#{node['openfire']['version']}_all.deb"
  local_package_path = "#{Chef::Config['file_cache_path']}/openfire.deb"
end

remote_file local_package_path do
  checksum node['openfire']['source_checksum']
  source "http://www.igniterealtime.org/downloadServlet?filename=#{source_file}"
end

dpkg_package 'openfire' do
  source local_package_path 
end

service 'openfire'

template '/etc/openfire/openfire.xml' do
  owner node['openfire']['user']
  group node['openfire']['group']
  mode '0600'
  notifies :restart, "service[openfire]"
end

