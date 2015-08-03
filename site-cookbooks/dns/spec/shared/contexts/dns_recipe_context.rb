RSpec.shared_context 'DNS mock' do
  before do
    Fog.mock!
    Fog::Mock.reset

    @fog_dns = Fog::DNS.new(
      provider: 'AWS',
      aws_access_key_id: 'MOCK_ACCESS_KEY',
      aws_secret_access_key: 'MOCK_SECRET_KEY'
    )
    @fog_dns.create_hosted_zone('example.com')
  end
end
