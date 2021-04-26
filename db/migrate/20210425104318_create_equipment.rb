class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.integer :genre, null: false
      t.string :lab_equipment_name, null: false
      t.string :maker_name, null: false
      t.string :product_name, null: false
      t.integer :purchase_year, null: false
      t.string :asset_num
      t.integer :price
      t.integer :lendings_status, null: false, default: 0
      t.integer :disposal_status, null: false, default: 0
      t.text :remarks
      t.references :registered_user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
