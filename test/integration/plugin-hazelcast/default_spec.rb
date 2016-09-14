describe service('openfire') do
  it { should be_running }
end

describe file('/opt/openfire/plugins/hazelcast.jar') do
  it { should exist }
end

describe file('/opt/openfire/conf/openfire.xml') do
  its(:content) { should match '<enabled>true</enabled>' }
end

describe file('/opt/openfire/conf/hazelcast-cache-config.xml') do
  its(:content) { should match '<member>member1.foo.com:5701</member>' }
  its(:content) { should match '<member>member2.foo.com:5701</member>' }
end

describe file('/opt/openfire/conf/openfire.xml') do
  its(:content) { should match 'org.jivesoftware.database.EmbeddedConnectionProvider' }
  its(:content) { should match '9090' }
  its(:content) { should match '9091' }
end
