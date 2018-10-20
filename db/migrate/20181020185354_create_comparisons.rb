class CreateComparisons < ActiveRecord::Migration[5.2]
  def change
    create_table :comparisons do |t|
      t.timestamps

      t.integer :ticket_id
      t.integer :normal_log_set_id
      t.integer :anomaly_log_set_id

      t.integer :lock_version, default: 0
    end
    add_index :comparisons, :ticket_id
    add_index :comparisons, :normal_log_set_id
    add_index :comparisons, :anomaly_log_set_id
    add_foreign_key :comparisons, :tickets
    add_foreign_key :comparisons, :command_log_sets
  end
end
