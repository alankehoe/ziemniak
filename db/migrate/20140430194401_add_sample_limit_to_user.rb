class AddSampleLimitToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :sample_limit, :integer
    User.all.each do |user|
      user.sample_limit = 10
      user.save!
    end
  end

  def self.down
  end
end
