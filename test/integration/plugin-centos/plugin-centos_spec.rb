describe service('openfire') do
  it { should be_running }
end

describe file('/opt/openfire/plugins/clustering.jar') do
  it { should exist }
end

describe file('/opt/openfire/conf/openfire.xml') do
  its(:content) { should match <<-EOH
<clustering>
  <enabled>true</enabled>
</clustering>
EOH
     }
end

describe file('/opt/openfire/conf/hazelcast-cache-config.xml') do
  its(:content) { should match '<member>member1.foo.com</member>' }
end

describe file('/opt/openfire/conf/hazelcast-cache-config.xml') do
  its(:content) { should match '<member>member2.foo.com</member>' }
end
