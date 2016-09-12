include_recipe 'ignite-openfire'

openfire_plugin 'clustering' do
  source_url 'https://www.igniterealtime.org/projects/openfire/plugins/clustering.jar'
end
