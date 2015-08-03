require_relative '../spec_helper'

describe 'dns::create' do
  include_context 'DNS mock'

  let!(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['dns']) do |node|
      node.set[:route53][:zone_id] = @fog_dns.zones.first.id
      node.set[:route53][:aws_access_key_id] = 'MOCK_ACCESS_KEY'
      node.set[:route53][:aws_secret_access_key] = 'MOCK_SECRET_KEY'
      node.set[:route53][:instance_name] = 'test'
      node.set[:route53][:stack_name] = 'test'
      node.set[:route53][:value] = '192.0.2.235'
      node.set[:route53][:type] = 'A'
    end.converge('dns::create')
  end

  let(:record) { @fog_dns.zones.first.records.first }

  it 'install creates DNS record' do
    expect(record.name).to eq('test.test.example.com.')
    expect(record.value).to match_array('192.0.2.235')
    expect(record.type).to eq('A')
  end
end
