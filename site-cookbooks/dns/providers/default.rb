use_inline_resources

#Create Action
action :create do
  require 'fog/aws'

  fetch_zone
  create
end

#Delete Action
action :delete do
  require 'fog/aws'

  fetch_zone
  delete
end

def load_current_resource
  @current_resource = Chef::Resource::Dns.new(@new_resource.instance_name)

  @current_resource.stack_name(@new_resource.stack_name)
  @current_resource.value(@new_resource.value)
  @current_resource.type(@new_resource.type)
  @current_resource.zone_id(@new_resource.zone_id)
  @current_resource.aws_access_key_id(@new_resource.aws_access_key_id)
  @current_resource.aws_secret_access_key(@new_resource.aws_secret_access_key)
end

def create
  if @zone.records.get(record_attributes[:name], record_attributes[:type])
    Chef::Log.error "DNS record #{record_attributes[:name]} exist"
  else
    response = @zone.records.create(record_attributes)
    Chef::Log.info "Created DNS record #{response.name}" if response
  end
rescue Excon::Errors::BadRequest => e
  Chef::Log.error e.response.body
end

def delete
  record = @zone.records.get(record_attributes[:name], record_attributes[:type])
  if record
    response = record.destroy
    Chef::Log.info "Deleted DNS record #{record_attributes[:name]}" if response
  else
    Chef::Log.error "DNS record #{record_attributes[:name]} not found"
  end
rescue Excon::Errors::BadRequest => e
  Chef::Log.error e.response.body
end

def fetch_zone
  route53 = Fog::DNS.new(connection_params)
  @zone = route53.zones.get(@current_resource.zone_id)
end

def connection_params
  {
    :provider => 'AWS',
    :aws_access_key_id => @current_resource.aws_access_key_id,
    :aws_secret_access_key => @current_resource.aws_secret_access_key
  }
end

def record_attributes
  {
    :name => [@current_resource.name, @current_resource.stack_name, @zone.domain].join('.'),
    :type => @current_resource.type,
    :value => @current_resource.value
  }
end
