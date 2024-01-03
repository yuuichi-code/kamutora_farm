Rails.application.config.session_store :redis_store, expire_after: 1.day, servers: {
  host: ENV['REDIS_HOST'],
  port: ENV['REDIS_PORT'],
  password: ENV['REDIS_PASSWORD'],
  namespace: ENV['REDIS_NAMESPACE']
}