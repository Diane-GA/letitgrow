class DestroyAncestry < ActiveRecord::Migration[7.2]
  def change
    remove_column :cultures, :ancestry
  end
end
