# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blorgh_session',
  :secret      => '005e1029f4cdb6d2f5a5cbfb599cbb206e407cbe3156f906514e75ed8f11e54d685a317f03a45b80ea49033226c3d9d867d977852d0f200e682823aecd320601'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
