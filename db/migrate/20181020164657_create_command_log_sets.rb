class CreateCommandLogSets < ActiveRecord::Migration[5.2]
  def change
    create_table :command_log_sets do |t|
      t.string :name, null: false
      t.string :hostname, null: false
      t.boolean :is_normal, null: false, default: false

      t.integer :ticket_id

      t.integer :lock_version, default: 0
    end
    add_index :command_log_sets, :ticket_id
    add_foreign_key :command_log_sets, :tickets
  end
end
