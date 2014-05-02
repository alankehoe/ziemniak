require 'spec_helper'

describe Api::UsersController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:other_user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    it 'assigns all users' do
      get :index

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/users/index'
    end
  end

  describe 'GET show' do
    it 'assigns a user' do
      get :show, id: user.id

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/users/show'
    end
  end

  describe 'PUT update' do
    it 'updates a user if user is current user' do
      put :update, id: user.id, :user => FactoryGirl.attributes_for(:user)

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/users/update'
    end

    it 'does not update a user if user is not current user' do
      put :update, id: other_user.id, :user => FactoryGirl.attributes_for(:user)

      expect(response.status).to eq(403)
      expect(response).to render_template 'api/errors/not_privileged'
    end
  end

  describe 'POST create' do
    describe 'When valid params are presented' do
      it 'assigns a new User' do
        post :create, :user => FactoryGirl.attributes_for(:user)

        expect(response.status).to eq(200)
        expect(response).to render_template 'api/users/create'
      end
    end

    describe 'When invalid params are presented' do
      it 'assigns a new User' do
        post :create, :user => FactoryGirl.attributes_for(:sample)

        expect(response.status).to eq(400)
        expect(response).to render_template 'api/errors/record_invalid'
      end
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a user if user is current user' do
      delete :destroy, id: user.id

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/users/destroy'
    end

    it 'does not delete a user if user is not current user' do
      delete :destroy, id: other_user.id

      expect(response.status).to eq(403)
      expect(response).to render_template 'api/errors/not_privileged'
    end
  end
end
