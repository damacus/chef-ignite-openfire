include_recipe 'chef-sugar'
include_recipe 'openfire::linux' if linux?
include_recipe 'openfire::windows' if windows?
