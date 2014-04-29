class AddColumnsToSample < ActiveRecord::Migration
  def change
    add_column :samples, :reference, :text
    add_column :samples, :yandex, :text
    add_column :samples, :bing, :text
  end
end
