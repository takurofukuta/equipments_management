class CreateOperationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_histories do |t|
      t.integer :content, null: false
      t.string :lab_equipment_name, null: false
      t.references :operated_user, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
