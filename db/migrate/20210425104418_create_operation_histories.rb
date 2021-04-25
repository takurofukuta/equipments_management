class CreateOperationHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_histories do |t|

      t.timestamps
    end
  end
end
