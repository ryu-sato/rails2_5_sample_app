class CreateAnomalyLogRaws < ActiveRecord::Migration[5.2]
  def change
    create_table :anomaly_log_raws do |t|
      t.string :hostname, null: false

      t.integer :lock_version, default: 0
    end
  end
end
