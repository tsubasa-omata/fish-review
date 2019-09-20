CarrierWave.configure do |config|
  #if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECLET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    config.fog_provider = 'fog/aws'
    config.fog_directory = 'fish-review'
    config.cache_storage = :fog
  #else
    #config.storage :file
    #config.enable_processing = false if Rails.env.test?
  #end
end
