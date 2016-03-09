CarrierWave.configure do |config|
  # "fog_provider" has to be removed and the CarrierWave documentation 
  # is (still) wrong about it.
  #config.fog_provider = 'fog/aws'                                          # required
  config.fog_credentials = {
    provider:              'AWS',                                          # required
    aws_access_key_id:     ENV["aws_access_key_id"],                       # required
    aws_secret_access_key: ENV["aws_secret_access_key"],                   # required
    #region:                'eu-west-1',                                    # optional, defaults to 'us-east-1'
    #host:                  's3.example.com',                               # optional, defaults to nil
    #endpoint:              'https://s3.example.com:8080'                   # optional, defaults to nil
  }
  config.fog_directory  = ENV["fog_directory"]                             # required
  config.fog_public     = false                                            # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
  # https://github.com/carrierwaveuploader/carrierwave/issues/1631
  # flanger001 commented on Sep 11, 2015
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.storage = :fog
end