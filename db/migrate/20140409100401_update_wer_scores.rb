class UpdateWerScores < ActiveRecord::Migration
  def change
    Sample.all.each do |sample|
      sample.bing_wer = Ziemniak::Wer.get_wer sample.bing, sample.reference
      sample.yandex_wer = Ziemniak::Wer.get_wer sample.yandex, sample.reference
      sample.save!
    end
  end
end
