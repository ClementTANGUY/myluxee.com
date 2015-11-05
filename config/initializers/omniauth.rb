Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: 'email,public_profile', info_fields: 'email, first_name, last_name'
  provider :linkedin, ENV["LINKEDIN_ID"], ENV['LINKEDIN_SECRET']

end