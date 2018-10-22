class CreateCommandLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :command_logs do |t|
      t.string :name, null: false
      t.string :result, null: false

      t.references :command_log_set, index: true, foreign_key: true

      t.integer :lock_version, default: 0
    end
  end
end
