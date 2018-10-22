class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :code, null: false

      t.references :host, index: true, foreign_key: true

      t.integer :lock_version, default: 0
    end
  end
end
