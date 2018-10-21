class CreateNormalCommandLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :normal_command_logs do |t|
      t.string :name, null: false

      t.integer :normal_command_log_set_id
      t.integer :comparison_unit_id

      t.integer :lock_version, default: 0
    end
    add_index :normal_command_logs, :normal_command_log_set_id
    add_index :normal_command_logs, :comparison_unit_id
    add_foreign_key :normal_command_logs, :normal_command_log_sets
    add_foreign_key :normal_command_logs, :comparison_units
  end
end
