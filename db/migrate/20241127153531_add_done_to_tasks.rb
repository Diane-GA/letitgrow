class AddDoneToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :done, :boolean
  end
end
