class AddDelayToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :delay, :integer
  end
end
