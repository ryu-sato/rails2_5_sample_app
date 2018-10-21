class CreateProcessings < ActiveRecord::Migration[5.2]
  def change
    create_table :processings do |t|
      t.integer :normal_log_raw_id
      t.integer :anomaly_log_raw_id

      t.integer :lock_version, default: 0
    end
    add_index :processings, :normal_log_raw_id
    add_index :processings, :anomaly_log_raw_id
    add_foreign_key :processings, :normal_log_raws
    add_foreign_key :processings, :anomaly_log_raws
  end
end
