class Sample < ActiveRecord::Base
  validates_presence_of :body

  before_create :get_yandex
  before_create :get_bing

  def update_scores
    self.bing_bleu = Ziemniak::Bleu::calculate_blue_score bing, reference
    self.yandex_bleu = Ziemniak::Bleu::calculate_blue_score yandex, reference
    self.bing_wer = Ziemniak::Wer.get_wer bing, reference
    self.yandex_wer = Ziemniak::Wer.get_wer yandex, reference
    self.bing_nist = Ziemniak::Nist.get_nist bing, reference
    self.yandex_nist = Ziemniak::Nist.get_nist yandex, reference
  end

  private

  def get_yandex
    self.yandex = Ziemniak::Yandex.get body
  end

  def get_bing
    self.bing = Ziemniak::Bing.get body
  end
end
