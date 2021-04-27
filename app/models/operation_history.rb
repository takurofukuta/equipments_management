class OperationHistory < ApplicationRecord
  belongs_to :user, foreign_key: :operated_user_id

  enum content: {
    add_data: 0,
    edit_data: 1,
    delete_data: 2,
  }
end
