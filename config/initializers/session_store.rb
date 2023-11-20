Rails.application.config.session_store :redis_store, expire_after: 1.day, servers: {
  host: "localhost",
  port: 6379,
  namespace: "user_sessions"
}