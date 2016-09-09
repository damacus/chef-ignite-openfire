case os[:family]
when 'debin', 'ubuntu', 'amazon', 'centos', 'oracle', 'redhat', 'scientific'
  describe file('/opt/openfire') do
    it { should exist }
  end
  describe file('/etc/sysconfig') do
    it { should exist }
  end
  describe file('/etc/sysconfig') do
    it { should contain '/var/log/openfire.log' }
  end
  describe service('openfire') do
    it { should be_running }
  end
when 'windows'
  describe file('C:\Program Files (x86)\Openfire') do
    it { should exist }
  end
  describe service('Openfire') do
    it { should be_running }
  end
end
