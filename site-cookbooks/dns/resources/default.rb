actions :create, :delete

default_action :create

attribute :instance_name,         :kind_of => String, :required => true, :name_attribute => true
attribute :stack_name,            :kind_of => String, :required => true
attribute :value,                 :kind_of => [ String, Array ]
attribute :type,                  :kind_of => String, :required => true
attribute :zone_id,               :kind_of => String
attribute :aws_access_key_id,     :kind_of => String
attribute :aws_secret_access_key, :kind_of => String
