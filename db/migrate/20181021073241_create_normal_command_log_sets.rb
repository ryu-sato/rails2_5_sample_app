class CreateNormalCommandLogSets < ActiveRecord::Migration[5.2]
  def change
    create_table :normal_command_log_sets do |t|
      t.string :type, null: false

      t.integer :normal_log_raw_id
      t.integer :comparison_set_id

      t.integer :lock_version, default: 0
    end
    add_index :normal_command_log_sets, :normal_log_raw_id
    add_index :normal_command_log_sets, :comparison_set_id
    add_foreign_key :normal_command_log_sets, :normal_log_raws
    add_foreign_key :normal_command_log_sets, :comparison_sets
  end
end
