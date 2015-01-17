# Support whyrun
def whyrun_supported?
  true
end


action :install do
  unless @current_resource.exists
    Chef::Log.info("loading #{plugin_filename} from #{@new_resource.source}")
    remote_file plugin_filename do
      source new_resource.source
      owner node['openfire']['user']
      group node['openfire']['group']
      mode '0750'
      notifies :restart, "service[openfire]"
    end
    @new_resource.updated_by_last_action(true)
  end
end

action :remove do
  if @current_resource.exists
    Chef::Log.info("removing #{plugin_filename}")
    file plugin_filename do
      action :delete
      notifies :restart, "service[openfire]"
    end
    @new_resource.updated_by_last_action(true)
  end
end

def load_current_resource
  @current_resource = Chef::Resource::OpenfirePlugin.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  @current_resource.source(@new_resource.source)

  @current_resource.exists = true if ::File.exist?(plugin_filename)
end


def plugin_filename
  "#{node['openfire']['plugin_dir']}/#{new_resource.name}.jar"
end
