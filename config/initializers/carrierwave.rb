CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['S3_KEY'],
    aws_secret_access_key: ENV['S3_SECRET'],
    region:                'us-west-2',
    host:                  's3-us-west-2.amazonaws.com'
    # endpoint:            'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = "hamandeggs-#{Rails.env}"
  config.fog_public     = false                                            # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
