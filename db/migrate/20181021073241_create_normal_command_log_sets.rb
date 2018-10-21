class CreateNormalCommandLogSets < ActiveRecord::Migration[5.2]
  def change
    create_table :normal_command_log_sets do |t|
      t.string :phase, null: false

      t.integer :normal_log_raw_id

      t.integer :lock_version, default: 0
    end
    add_index :normal_command_log_sets, :normal_log_raw_id
    add_foreign_key :normal_command_log_sets, :normal_log_raws
  end
end
