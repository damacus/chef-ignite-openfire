resource_name :openfire_plugin
default_action :install

property :source_url, String, required: true
property :plugin_name, String, name_property: true, required: true
property :plugin_dir, String, required: false, default: lazy {
  ::File.join(default['openfire']['home_dir'], 'plugins')
}
property :openfire_user, String, default: lazy { node['openfire']['user'] }
property :openfire_group, String, default: lazy { node['openfire']['group'] }

action :install do
  unless @current_resource.exists
    Chef::Log.info("loading #{plugin_name} from #{@new_resource.source_url}")
    remote_file plugin_name do
      path "#{plugin_dir}/#{plugin_name}.jar"
      source source_url
      owner openfire_user
      group openfire_group
      mode '0750'
      notifies :restart, 'service[openfire]'
    end
    @new_resource.updated_by_last_action(true)
  end
end

action :remove do
  if @current_resource.exists
    Chef::Log.info("removing #{plugin_filename}")
    file plugin_filename do
      action :delete
      notifies :restart, 'service[openfire]'
    end
    @new_resource.updated_by_last_action(true)
  end
end
