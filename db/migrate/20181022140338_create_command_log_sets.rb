class CreateCommandLogSets < ActiveRecord::Migration[5.2]
  def change
    create_table :command_log_sets do |t|
      t.string :phase, null: false

      t.references :raw_log, index: true, foreign_key: true

      t.integer :lock_version, default: 0
    end
  end
end
