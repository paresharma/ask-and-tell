# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
# end

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :google_oauth2,
    Rails.application.credentials.dig(:google, :client_id) || ENV['GOOGLE_CLIENT_ID'],
    Rails.application.credentials.dig(:google, :client_secret) || ENV['GOOGLE_CLIENT_SECRET'],
    { client_options: { ssl: { ca_file: Rails.root.join('cacert.pem').to_s }}}
  )
end
