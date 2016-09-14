include_recipe 'ignite-openfire'

hazelcast_plugin 'clustering' do
  source_url 'https://www.igniterealtime.org/projects/openfire/plugins/hazelcast.jar'
  cluster_members ['member1.foo.com:5701','member2.foo.com:5701']
end
