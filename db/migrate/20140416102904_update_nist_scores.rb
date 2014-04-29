class UpdateNistScores < ActiveRecord::Migration
  def self.up
    Sample.all.each do |sample|
      sample.bing_nist = Ziemniak::Nist.get_nist sample.bing, sample.reference
      sample.yandex_nist = Ziemniak::Nist.get_nist sample.yandex, sample.reference
      puts "updated #{sample.id}"
      sample.save!
    end
  end

  def self.down

  end
end
