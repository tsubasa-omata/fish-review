CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAXCNMTP35H2JP35N4',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
    }

  config.fog_directory = 'fish-review'
  config.cache_storage = :fog
end
