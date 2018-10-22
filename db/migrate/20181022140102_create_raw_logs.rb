class CreateRawLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :raw_logs do |t|
      t.string :log_type, null: false
      t.date :acquisition_date, null: false

      t.references :host, index: true, foreign_key: true
      t.references :ticket, index: true, foreign_key: true

      t.integer :lock_version, default: 0
    end
  end
end
