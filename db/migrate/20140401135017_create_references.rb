class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.text :body
      t.belongs_to :sample

      t.timestamps
    end
  end
end
