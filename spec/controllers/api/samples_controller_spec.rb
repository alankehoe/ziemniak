require 'spec_helper'

describe Api::SamplesController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:sample) { FactoryGirl.create :sample }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    it 'assigns all current users samples' do
      get :index

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/samples/index'
    end
  end

  describe 'GET show' do
    it 'assigns a sample if its the current users sample' do
      user.samples << sample
      get :show, id: sample.id

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/samples/show'
    end

    it 'does not assigns a sample if its not the current users sample' do
      get :show, id: sample.id

      expect(response.status).to eq(404)
      expect(response).to render_template 'api/errors/record_not_found'
    end
  end

  describe 'PUT update' do
    it 'updates a sample if it belongs to the current user' do
      user.samples << sample
      put :update, id: sample.id, :sample => FactoryGirl.attributes_for(:sample)

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/samples/update'
    end

    it 'does not update a sample if it does not belong to the current user' do
      put :update, id: sample.id, :user => FactoryGirl.attributes_for(:sample)

      expect(response.status).to eq(404)
      expect(response).to render_template 'api/errors/record_not_found'
    end
  end

  describe 'POST create' do
    describe 'When valid params are presented' do
      it 'assigns a new sample' do
        pending 'Why you no work'
        post :create, :sample => FactoryGirl.attributes_for(:sample)

        puts response.body
        expect(response.status).to eq(200)
        expect(response).to render_template 'api/samples/create'
      end
    end

    describe 'When invalid params are presented' do
      it 'does not assign a new sample' do
        post :create, :sample => FactoryGirl.attributes_for(:user)

        expect(response.status).to eq(400)
        expect(response).to render_template 'api/errors/record_invalid'
      end
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a sample if it belongs to current user' do
      user.samples << sample
      delete :destroy, id: sample.id

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/samples/destroy'
    end

    it 'does not delete a sample if its not owned by the current user' do
      delete :destroy, id: sample.id

      expect(response.status).to eq(404)
      expect(response).to render_template 'api/errors/record_not_found'
    end
  end
end
