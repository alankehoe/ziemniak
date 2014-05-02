require 'spec_helper'

describe Api::MeController do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }

  before :each do
    controller.stub(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    it 'returns a me object' do
      get :index

      expect(response.status).to eq(200)
      expect(response).to render_template 'api/me/index'
    end
  end
end
