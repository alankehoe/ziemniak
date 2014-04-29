class AddWerToSample < ActiveRecord::Migration
  def change
    add_column :samples, :yandex_wer, :float
    add_column :samples, :bing_wer, :float
  end
end
