#
# Cookbook Name:: dns
# Recipe:: create
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
chef_gem "fog-aws" do
  action :install
  version node['route53']['fog_version']
  compile_time false
end

require 'rubygems'
Gem.clear_paths

dns 'create DNS record' do
  instance_name         node[:route53][:instance_name]
  stack_name            node[:route53][:stack_name]
  value                 node[:route53][:value]
  type                  node[:route53][:type]
  zone_id               node[:route53][:zone_id]
  aws_access_key_id     node[:route53][:aws_access_key_id]
  aws_secret_access_key node[:route53][:aws_secret_access_key]
  action :create
end
