=begin
Rails.application.config.session_store :redis_store, expire_after: 1.day, servers: {
  host: "fly-kamutora-farm-redis.upstash.io",
  port: 6379,
  password: "f4fbc6c43a30474786123aa2fd0877dd",
  namespace: "user_sessions"
}
=end
