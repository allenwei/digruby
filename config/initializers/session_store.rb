# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_digruby_session',
  :secret      => '9782530e4cc7ae1c04b40af49fee9f9427b31775c2d268e724c5e3d8d0ded9e34ce39d9f35eb4bc0fcdf7f520e742ebeba248b96ba597cf3040dd3516e54cdce'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
