module Api
  class MeController < BaseController
    doorkeeper_for :all

    resource_description do
      short_description 'Me resource'
      full_description 'Everything about the current user'
    end

    def_param_group :me do
      param :me, Hash, :required => true do
        param :first_name, String, :required => true
        param :last_name, String, :required => true
        param :email, String, :required => true
        param :password, String, :required => true
        param :password_confirmation, String, :required => true
      end
    end

    #######################################################################################

    api :GET, '/me'
    description 'Returns current user from the database'
    example File.read("#{Rails.root}/doc/api/users/show.json")
    example File.read("#{Rails.root}/doc/api/users/show.xml")

    def index
      @current_user = current_user
      respond_with @current_user
    end

    #######################################################################################

    api :PUT, '/me'
    description 'Updates the current user in the database'
    example File.read("#{Rails.root}/doc/api/users/update.json")
    example File.read("#{Rails.root}/doc/api/users/update.xml")
    param_group :me

    def update
      @current_user = current_user
      @current_user.update! user_params
      respond_with @current_user
    end

    #######################################################################################

    private

    def user_params
      params.required(:me).permit :first_name, :last_name, :email, :password, :password_confirmation
    end
  end
end
