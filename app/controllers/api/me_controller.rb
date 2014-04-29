module Api
  class MeController < BaseController
    doorkeeper_for :all

    def index
      @current_user = current_user
      respond_with @current_user
    end

    def update
    end
  end
end
