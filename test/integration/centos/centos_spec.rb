describe file('/opt/openfire') do
  it { should exist }
end

describe file('/etc/sysconfig') do
  it { should exist }
end

describe file('/etc/sysconfig/openfire') do
  its(:content) { should match '/opt/openfire/logs' }
end

describe service('openfire') do
  it { should be_running }
end

describe file('/opt/openfire/conf/openfire.xml') do
  it { should exist }
end

describe file('/opt/openfire/conf/openfire.xml') do
  its(:content){ should match 'org.jivesoftware.database.EmbeddedConnectionProvider' }
end
