class CreateCommandLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :command_logs do |t|
      t.string :name, null: false
      t.string :result, null: false, default: ''

      t.integer :command_log_set_id

      t.integer :lock_version, default: 0
    end
    add_index :command_logs, :command_log_set_id
    add_foreign_key :command_logs, :command_log_sets
  end
end
