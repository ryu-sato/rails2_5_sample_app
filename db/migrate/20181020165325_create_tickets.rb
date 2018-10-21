class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :code, null: false
      t.string :maker, null: false
      t.string :hostname, null: false

      t.integer :normal_log_raw_id
      t.integer :anomaly_log_raw_id
          
      t.integer :lock_version, default: 0
    end
    add_index :tickets, :normal_log_raw_id
    add_foreign_key :tickets, :normal_log_raws

    add_index :tickets, :anomaly_log_raw_id
    add_foreign_key :tickets, :anomaly_log_raws
  end
end
