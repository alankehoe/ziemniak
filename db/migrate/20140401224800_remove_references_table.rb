class RemoveReferencesTable < ActiveRecord::Migration
  def change
    drop_table :references
  end
end
