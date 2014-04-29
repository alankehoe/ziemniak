module Api
  class BaseController < ApplicationController
    include Ziemniak::Rescue

    respond_to :json, :xml

    private

    def current_user
      @current_user ||= User.find doorkeeper_token.resource_owner_id if doorkeeper_token
    end
  end
end
