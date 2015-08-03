require_relative '../spec_helper'

describe 'dns::delete' do
  include_context 'DNS mock'

  before do
    @fog_dns.zones.first.records.create(
      {
        name: 'test.test.example.com',
        type: 'A',
        value: '192.0.2.235'
      }
    )
  end

  let!(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['dns']) do |node|
      node.set[:route53][:zone_id] = @fog_dns.zones.first.id
      node.set[:route53][:aws_access_key_id] = 'MOCK_ACCESS_KEY'
      node.set[:route53][:aws_secret_access_key] = 'MOCK_SECRET_KEY'
      node.set[:route53][:instance_name] = 'test'
      node.set[:route53][:stack_name] = 'test'
      node.set[:route53][:type] = 'A'
    end.converge('dns::delete')
  end

  let(:record) { @fog_dns.zones.first.records.first }

  it 'remove DNS zone' do
    expect(record).to be_nil
  end
end
