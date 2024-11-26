class AddMasterToCultures < ActiveRecord::Migration[7.2]
  def change
    add_column :cultures, :master, :boolean
  end
end
