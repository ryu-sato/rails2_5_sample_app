class CreateRawCommandLogSets < ActiveRecord::Migration[5.2]
  def change
    create_table :raw_command_log_sets do |t|
      t.string :hostname, null: false
      t.boolean :is_normal, null: false, default: false

      t.integer :ticket_id
      t.integer :command_log_set_id

      t.timestamps

      t.integer :lock_version, default: 0
    end
    add_index :raw_command_log_sets, :ticket_id
    add_index :raw_command_log_sets, :command_log_set_id
    add_foreign_key :raw_command_log_sets, :tickets
    add_foreign_key :raw_command_log_sets, :command_log_sets
  end
end
