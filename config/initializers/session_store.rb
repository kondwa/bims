# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bims_session',
  :secret      => '89e71a7e950d6bc5696a11ccf512abe7f940e5ece80b4e09b0852eb32cdb0c808c453f5fc3eda36d7ed8eba48c431366ddd8feddc6aac41142cab92219baace4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
