actions :install, :remove
default_action :install

attribute :source, :kind_of => String, :required => true

attr_accessor :exists
