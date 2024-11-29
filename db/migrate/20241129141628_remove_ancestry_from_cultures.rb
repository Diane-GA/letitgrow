class RemoveAncestryFromCultures < ActiveRecord::Migration[7.2]
  def change
    remove_column :cultures, :ancestry, :string
  end
end
