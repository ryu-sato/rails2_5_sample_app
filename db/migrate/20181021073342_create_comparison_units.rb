class CreateComparisonUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :comparison_units do |t|
      t.string :diff_summary, null: false

      t.integer :normal_command_log_id
      t.integer :anomaly_command_log_id

      t.integer :lock_version, default: 0
    end
    add_index :comparison_units, :normal_command_log_id
    add_index :comparison_units, :anomaly_command_log_id
    add_foreign_key :comparison_units, :normal_command_logs
    add_foreign_key :comparison_units, :anomaly_command_logs
  end
end
