class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :date
      t.string :status
      t.integer :order
      t.string :category
      t.references :culture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
