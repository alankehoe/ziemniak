Apipie.configure do |config|
  config.app_name = 'Ziemniak'
  config.copyright = "&copy; #{Time.now.year} Ziemniak"
  config.api_base_url = '/api'
  config.doc_base_url = '/docs'
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info = '
    This is where you can inform user about your application and API
    in general.
  '
  config.validate = false
  # config.markup = Apipie::Markup::Markdown.new
  config.reload_controllers = Rails.env.development?
  config.api_routes = Rails.application.routes
  # config.authenticate = Proc.new do
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'test' && password == 'supersecretpassword'
  #   end
  # end
end
