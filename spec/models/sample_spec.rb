require 'spec_helper'

describe Sample do
  it 'should belong to user' do
    should belong_to(:user)
  end

  it 'should validate presence of body' do
    should validate_presence_of(:body)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:sample)).to be_valid
  end
end
