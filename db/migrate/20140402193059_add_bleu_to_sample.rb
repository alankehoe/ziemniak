class AddBleuToSample < ActiveRecord::Migration
  def change
    add_column :samples, :yandex_bleu, :float
    add_column :samples, :bing_bleu, :float
  end
end
