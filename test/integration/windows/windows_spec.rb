describe file('C:\Program Files (x86)\Openfire') do
  it { should exist }
end

describe service('Openfire') do
  it { should be_running }
end
