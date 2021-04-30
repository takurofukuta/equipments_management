class CreateOperationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_histories do |t|
      t.integer :content, null: false
      t.string :object, null: false
      t.integer :operated_user_id, null: false, index: true
      t.timestamps
    end
    add_foreign_key :operation_histories, :users, column: :operated_user_id
  end
end
