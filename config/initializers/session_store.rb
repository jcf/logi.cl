# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_logi.cl_session',
  :secret      => '30e33b2254806611f04db380ed9a029df31741c2e8ac25658bfc7706f000b67bb1f85b8722cae89acdce9336246a4e6e931f7d9c0b94dc6a6198491a6026b23d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
