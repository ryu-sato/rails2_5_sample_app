class CreateComparisonSets < ActiveRecord::Migration[5.2]
  def change
    create_table :comparison_sets do |t|
      t.string :diff_summary, null: false
      t.string :phase, null: false

      t.integer :ticket_id

      t.integer :lock_version, default: 0
    end
    add_index :comparison_sets, :ticket_id
    add_foreign_key :comparison_sets, :tickets
  end
end
