if Rails.env.development?
  Sidekiq.configure_server do |config|
    config.redis = {
      host: 'localhost',
      namespace: 'sidekiq',
      port: 6379
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      host: 'localhost',
      namespace: 'sidekiq',
      port: 6379
    }
  end
end

if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = {
      url: "redis://#{ENV['REDIS_SERVER_HOSTNAME']}:#{ENV['REDIS_SERVER_PORT']}",
      namespace: 'sidekiq'
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      url: "redis://#{ENV['REDIS_SERVER_HOSTNAME']}:#{ENV['REDIS_SERVER_PORT']}",
      namespace: 'sidekiq'
    }
  end
end
