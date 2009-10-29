# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bugtterTL_session',
  :secret      => '225ce95125fcf9c209f1f1a3d24a133ea4ef77bffe130e1ad520d3c5c223cda9aa2688485543f7269377798359091b9825868a78de204688c39b0fce8cc5cbe4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
