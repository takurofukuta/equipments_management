class CreateLendings < ActiveRecord::Migration[6.1]
  def change
    create_table :lendings do |t|
      t.integer :lending_user_id, null: false, index: true
      t.integer :borrowed_equipment_id, null: false, index: true
      t.timestamps
    end
    add_foreign_key :lendings, :users, column: :lending_user_id
    add_foreign_key :lendings, :equipment, column: :borrowed_equipment_id
  end
end
