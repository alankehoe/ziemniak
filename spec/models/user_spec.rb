require 'spec_helper'

describe User do
  it 'should have many samples' do
    should have_many(:samples)
  end
end
