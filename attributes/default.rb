
default['java']['jdk_version'] = 7
default['openfire']['version'] = '4.0.3'

default['openfire']['user'] = 'daemon'
default['openfire']['group'] = 'daemon'
# rubocop:disable LineLength
default['openfire']['checksum']['4.0.3']['deb'] = '2b34ec323d8aed52802b4f846624b645653a0044d0b9705b64494d0c30c2f71a'
default['openfire']['checksum']['4.0.3']['rpm'] = 'c76a92cbea5a1ef12552e49362e5cedb068eccdb0f8f7fe7481c3fc23cd29210'
default['openfire']['checksum']['4.0.3']['exe'] = 'bc860596c3db9bf0472199866244977a53f6d9b30a554195f504ef7b20ddc29d'

default['openfire']['base_dir'] = '/opt'
default['openfire']['home_dir'] = "#{node['openfire']['base_dir']}/openfire"
default['openfire']['log_dir']  = "#{node['openfire']['base_dir']}/openfire/logs"
# rubocop:enable LineLength
