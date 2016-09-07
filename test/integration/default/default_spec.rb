describe file('/opt/openfire/conf') do
  it { should be_linked_to '/etc/openfire' }
end
