class CreateGeneratingTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :generating_tickets do |t|
      t.string :ticket_code
      t.string :hostname
      t.bigint :normal_raw_log_id
      t.bigint :abnormal_raw_log_id

      t.timestamps
    end
  end
end
