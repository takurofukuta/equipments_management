class OperationHistory < ApplicationRecord
  belongs_to :user

  enum content: {
    add_data: 0,
    edit_data: 1,
    delete_data: 2,
  }
end
