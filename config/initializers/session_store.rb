=begin
Rails.application.config.session_store :redis_store, expire_after: 1.day, servers: {
  host: "fly-kamutora-farm-redis.upstash.io",
  port: 6379,
  password: "f4fbc6c43a30474786123aa2fd0877dd",
  namespace: "user_sessions"
}
Rails.application.config.session_store :redis_store, expire_after: 1.day, servers: {
  host: "localhost",
  port: 6379,
  namespace: "user_sessions"
}
=end
Rails.application.config.session_store :redis_store, expire_after: 1.day, servers: {
  host: ENV['REDIS_HOST'],
  port: ENV['REDIS_PORT'],
  password: ENV['REDIS_PASSWORD'],
  namespace: ENV['REDIS_NAMESPACE']
}