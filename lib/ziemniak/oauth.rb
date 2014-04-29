module Ziemniak
  module Oauth
    APP_ID = Doorkeeper::Application.find_by(name: 'Ziemniak').uid
    APP_SECRET = Doorkeeper::Application.find_by(name: 'Ziemniak').secret

    def self.get_uid
      APP_ID
    end

    def self.get_secret
      APP_SECRET
    end
  end
end