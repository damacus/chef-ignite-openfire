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
  its(:content) { should_not match 'org.jivesoftware.database.EmbeddedConnectionProvider' }
end

describe file('/opt/openfire/conf/openfire.xml') do
  its(:content) { should match '9090' }
end

describe file('/opt/openfire/conf/openfire.xml') do
  its(:content) { should match 'org.postgresql.Driver' }
end

describe file('/opt/openfire/conf/openfire.xml') do
  its(:content) { should match 'jdbc:postgresql://127.0.0.1:5432/openfire' }
end
