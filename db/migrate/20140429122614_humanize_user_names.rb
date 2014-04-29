class HumanizeUserNames < ActiveRecord::Migration
  def self.up
    User.all.each do |user|
      user.first_name = user.first_name.humanize
      user.last_name = user.last_name.humanize
      puts "update #{user.first_name} #{user.last_name}"
      user.save!
    end
  end

  def self.down
  end
end
