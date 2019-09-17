CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAXCNMTP35MXYKN2MA',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
    }

  config.fog_directory = 'fish-review'
  config.cache_storage = :fog
end
