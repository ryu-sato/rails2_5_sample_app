class CreateAnomalyCommandLogSets < ActiveRecord::Migration[5.2]
  def change
    create_table :anomaly_command_log_sets do |t|
      t.string :type, null: false

      t.integer :anomaly_log_raw_id
      t.integer :comparison_set_id

      t.integer :lock_version, default: 0
    end
    add_index :anomaly_command_log_sets, :anomaly_log_raw_id
    add_index :anomaly_command_log_sets, :comparison_set_id
    add_foreign_key :anomaly_command_log_sets, :anomaly_log_raws
    add_foreign_key :anomaly_command_log_sets, :comparison_sets
  end
end
