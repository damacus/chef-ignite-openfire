include_recipe 'chef-sugar'

version = node['openfire']['version'].to_s
version_windows = version.gsub('.','_')

case node['platform_family']
when 'rhel', 'suse'
  source_file = "openfire/openfire-#{version}-1.i386.rpm"
  local_package_path = "#{Chef::Config['file_cache_path']}/openfire.rpm"
  platform_checksum = node['openfire']['checksum'][version]['rpm']
when 'debian'
  source_file = "openfire/openfire_#{version}_all.deb"
  local_package_path = "#{Chef::Config['file_cache_path']}/openfire.deb"
  platform_checksum = node['openfire']['checksum'][version]['deb']
  platform_provider = Chef::Provider::Package::Dpkg
when 'windows'
  source_file = "openfire/openfire_#{version_windows}.exe"
  local_package_path = "#{Chef::Config['file_cache_path']}/openfire.exe"
  platform_checksum = node['openfire']['checksum'][version]['exe']
end

remote_file local_package_path do
  checksum platform_checksum
  source "http://www.igniterealtime.org/downloadServlet?filename=#{source_file}"
end

# Install platform specific deps
include_recipe 'openfire::linux' if linux?
include_recipe 'openfire::windows' if windows?

package 'openfire' do
  provider Chef::Provider::Package::Dpkg if debian?
  provider Chef::Provider::Package::Windows if windows?
  source local_package_path
  installer_type :custom if windows?
  options '-q' if windows?
  notifies :restart, 'service[Openfire]', :delayed
end

if windows?
  batch 'install openfire service' do
    cwd "#{node['openfire']['base_dir']}/bin"
    code <<-EOH
      openfire-service.exe /install
      EOH
    notifies :start, 'service[Openfire]', :immediately
  end
end

service 'Openfire'
