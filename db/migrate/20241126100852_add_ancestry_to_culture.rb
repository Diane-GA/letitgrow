class AddAncestryToCulture < ActiveRecord::Migration[7.2]
  def change
    add_column :cultures, :ancestry, :string
    add_index :cultures, :ancestry
  end
end
