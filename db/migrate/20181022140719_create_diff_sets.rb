class CreateDiffSets < ActiveRecord::Migration[5.2]
  def change
    create_table :diff_sets do |t|
      t.string :diff_summary, null: false
      t.string :phase, null: false

      t.references :ticket, index: true, foreign_key: true

      t.integer :lock_version, default: 0
    end
  end
end
