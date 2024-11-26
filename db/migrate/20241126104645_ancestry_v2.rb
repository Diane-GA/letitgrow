class AncestryV2 < ActiveRecord::Migration[7.2]
  def change
    change_table(:cultures) do |t|
      # postgres
      t.string "ancestry", collation: 'C', null: false
      t.index "ancestry"
    end
  end
end
