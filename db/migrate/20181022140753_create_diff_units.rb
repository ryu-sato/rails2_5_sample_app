class CreateDiffUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :diff_units do |t|
      t.string :diff
      t.string :name
      t.string :normal_log
      t.string :abnormal_log

      t.references :diff_set, index: true, foreign_key: true
    end
  end
end
