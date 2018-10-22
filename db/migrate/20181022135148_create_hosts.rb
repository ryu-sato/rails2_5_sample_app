class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :maker, null: false
      t.string :name, null: false

      t.integer :lock_version, default: 0
    end
  end
end
