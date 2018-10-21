class CreateAnomalyCommandLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :anomaly_command_logs do |t|
      t.string :name, null: false

      t.integer :anomaly_command_log_set_id
      t.integer :comparison_unit_id

      t.integer :lock_version, default: 0
    end
    add_index :anomaly_command_logs, :anomaly_command_log_set_id
    add_index :anomaly_command_logs, :comparison_unit_id
    add_foreign_key :anomaly_command_logs, :anomaly_command_log_sets
    add_foreign_key :anomaly_command_logs, :comparison_units
  end
end
