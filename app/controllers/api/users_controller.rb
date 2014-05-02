module Api
  class UsersController < BaseController
    doorkeeper_for :all, except: :create

    resource_description do
      short_description 'Users resource'
      full_description ''
    end

    def_param_group :user do
      param :user, Hash, :required => true do
        param :username, String, :required => true
        param :first_name, String, :required => true
        param :last_name, String, :required => true
        param :email, String, :required => true
        param :password, String, :required => true
        param :password_confirmation, String, :required => true
      end
    end

    before_action :set_instances, only: [:show, :update, :destroy]

    #######################################################################################

    api :GET, '/users'
    description 'Returns all users in the database'
    example File.read("#{Rails.root}/doc/api/users/index.json")
    example File.read("#{Rails.root}/doc/api/users/index.xml")

    def index
      @users = User.all
      respond_with @users
    end

    #######################################################################################

    api :GET, '/users/:id'
    description 'Returns specified user from the database'
    example File.read("#{Rails.root}/doc/api/users/show.json")
    example File.read("#{Rails.root}/doc/api/users/show.xml")
    param :id, :number, :required => true

    def show
      respond_with @user
    end

    #######################################################################################

    api :POST, '/users'
    description 'Creates a user in the database'
    example File.read("#{Rails.root}/doc/api/users/create.json")
    example File.read("#{Rails.root}/doc/api/users/create.xml")
    param_group :user

    def create
      @user = User.create!(user_params)
      respond_with @user
    end

    #######################################################################################

    api :PUT, '/samples/:id'
    description 'Updates the specified sample in the database'
    example File.read("#{Rails.root}/doc/api/users/update.json")
    example File.read("#{Rails.root}/doc/api/users/update.xml")
    param :id, :number, :required => true
    param_group :user

    def update
      @user.update!(user_params)
      respond_with @user
    end

    #######################################################################################

    api :DELETE, '/samples/:id'
    description 'Deletes the specified sample from the database'
    example File.read("#{Rails.root}/doc/api/users/destroy.json")
    example File.read("#{Rails.root}/doc/api/users/destroy.xml")
    param :id, :number, :required => true

    def destroy
      @user.destroy!
      respond_with @user
    end

    #######################################################################################

    private

    def set_instances
      @user = User.find params[:id]
    end

    def user_params
      params.required(:user).permit :username, :first_name, :last_name, :email, :password, :password_confirmation
    end
  end
end
