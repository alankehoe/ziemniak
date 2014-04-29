web_application = Doorkeeper::Application.new(
    :name => 'Ziemniak',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob'
)

if web_application.valid?
  web_application.save!

  puts %q[
OAuth application created
]
end