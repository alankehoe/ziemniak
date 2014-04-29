class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.text :body

      t.timestamps
    end
  end
end
