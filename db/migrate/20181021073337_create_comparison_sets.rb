class CreateComparisonSets < ActiveRecord::Migration[5.2]
  def change
    create_table :comparison_sets do |t|
      t.string :diff_summary, null: false

      t.integer :normal_command_log_set_id
      t.integer :anomaly_command_log_set_id

      t.integer :lock_version, default: 0
    end
    add_index :comparison_sets, :normal_command_log_set_id
    add_index :comparison_sets, :anomaly_command_log_set_id
    add_foreign_key :comparison_sets, :normal_command_log_sets
    add_foreign_key :comparison_sets, :anomaly_command_log_sets
  end
end
