CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'crowdfach'
  config.aws_acl    = 'public-read'

  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  config.aws_credentials = {
    access_key_id:        ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key:    ENV['AWS_SECRET_ACCESS_KEY'],
    region:               'eu-west-2',
  }

  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }
end