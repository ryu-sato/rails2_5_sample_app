class CreateNormalCommandLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :normal_command_logs do |t|
      t.string :name, null: false
      t.string :result, null: false

      t.integer :normal_command_log_set_id

      t.integer :lock_version, default: 0
    end
    add_index :normal_command_logs, :normal_command_log_set_id
    add_foreign_key :normal_command_logs, :normal_command_log_sets
  end
end
