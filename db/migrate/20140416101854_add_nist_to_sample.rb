class AddNistToSample < ActiveRecord::Migration
  def change
    add_column :samples, :yandex_nist, :float
    add_column :samples, :bing_nist, :float
  end
end
