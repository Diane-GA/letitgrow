class CreateCultures < ActiveRecord::Migration[7.2]
  def change
    create_table :cultures do |t|
      t.string :name
      t.date :plantation_date
      t.boolean :in_ground
      t.boolean :outdoor
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
