require 'spec_helper'

describe User do
  it 'should have many samples' do
    should have_many(:samples)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  describe 'methods' do
    let(:user) { FactoryGirl.create(:user, email: 'ziemniak@ziemnkia.ziemniak') }

    describe 'hash_gravatar' do
      it 'should create an MD5 hash of the users email' do
        expect(user.gravatar).to eq(Digest::MD5.hexdigest(user.email))
      end
    end
  end
end
