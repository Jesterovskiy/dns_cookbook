require_relative '../spec_helper'

describe 'dns::create' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['dns']) do |node|
      node.set[:route53][:fog_version] = '1.32'
      node.set[:route53][:zone_id] = 'ZXE1YQDJAVLMY'
      node.set[:route53][:aws_access_key_id] = 'AKIAJ6ZYJBYPAMCCOFKQ'
      node.set[:route53][:aws_secret_access_key] = '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'
      node.set[:route53][:instance_name] = 'test'
      node.set[:route53][:stack_name] = 'test'
      node.set[:route53][:value] = '192.0.2.235'
      node.set[:route53][:type] = 'A'
    end.converge('dns::create')
  end

  it 'install gem' do
    expect(chef_run).to install_chef_gem('fog-aws')
  end
end
