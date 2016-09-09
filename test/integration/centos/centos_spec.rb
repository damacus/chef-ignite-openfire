describe file('/opt/openfire') do
  it { should exist }
end

describe file('/etc/sysconfig') do
  it { should exist }
end

describe file('/etc/sysconfig/openfire') do
  its(:content) { should match ("/opt/openfire/logs") }
end

describe service('openfire') do
  it { should be_running }
end
