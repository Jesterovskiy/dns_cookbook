# DNS cookbook

## Local setup

### Setup

```
bundle install
```

### Run

```
knife solo cook -i ~/.ssh/amazon-pem-cert.pem instance-user@instance-dns-name -o "recipe[dns::create]"
```

## Development

### Testing

```
bundle exec rspec ./site-cookbooks/dns
```
