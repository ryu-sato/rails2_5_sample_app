class CreateAnomalyCommandLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :anomaly_command_logs do |t|
      t.string :name, null: false
      t.string :result, null: false

      t.integer :anomaly_command_log_set_id

      t.integer :lock_version, default: 0
    end
    add_index :anomaly_command_logs, :anomaly_command_log_set_id
    add_foreign_key :anomaly_command_logs, :anomaly_command_log_sets
  end
end
