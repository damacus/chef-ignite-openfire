node.default['openfire']['base_dir'] = 'C:\Program Files (x86)\Openfire'
node.default['openfire']['home_dir'] = "#{node['openfire']['base_dir']}"
node.default['openfire']['log_dir']  = "#{node['openfire']['base_dir']}\logs"
