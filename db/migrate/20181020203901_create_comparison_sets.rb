class CreateComparisonSets < ActiveRecord::Migration[5.2]
  def change
    create_table :comparison_sets do |t|
      t.string :name, null: false
      t.string :difference, null: false
      t.timestamps

      t.integer :ticket_id
      t.integer :normal_log_set_id
      t.integer :anomaly_log_set_id

      t.integer :lock_version, default: 0
    end
    add_index :comparison_sets, :ticket_id
    add_index :comparison_sets, :normal_log_set_id
    add_index :comparison_sets, :anomaly_log_set_id
    add_foreign_key :comparison_sets, :tickets
    add_foreign_key :comparison_sets, :command_log_sets, column: :normal_log_set_id
    add_foreign_key :comparison_sets, :command_log_sets, column: :anomaly_log_set_id
  end
end
