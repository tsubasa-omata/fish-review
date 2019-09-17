CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'aaa',
    aws_secret_access_key: '',
    region: 'ap-northeast-1'
    }

  config.fog_directory = 'fish-review'
  config.cache_storage = :fog
end
