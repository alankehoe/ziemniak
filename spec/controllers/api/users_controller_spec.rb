require 'spec_helper'

describe Api::UsersController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'POST create' do
    describe 'When valid params are presented' do
      it 'assigns a new User' do
        post :create, :user => FactoryGirl.attributes_for(:user)

        expect(response.status).to eq(200)
        expect(response).to render_template 'api/users/create'
      end
    end
  end

end
