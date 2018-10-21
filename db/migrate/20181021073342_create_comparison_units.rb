class CreateComparisonUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :comparison_units do |t|
      t.string :diff, null: false
      t.string :name, null: false

      t.integer :ticket_id

      t.integer :lock_version, default: 0
    end
    add_index :comparison_units, :ticket_id
    add_foreign_key :comparison_units, :tickets
  end
end
