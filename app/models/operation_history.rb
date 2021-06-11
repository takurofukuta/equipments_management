class OperationHistory < ApplicationRecord
  belongs_to :operated_user, class_name: "User", foreign_key: :operated_user_id
  validates :content, presence: true
  validates :object, presence: true
  class << self
    def create_log(operated_user_id, object, content)
      OperationHistory.create!(operated_user_id: operated_user_id, object: object, content: content)
    end
  end

  enum content: {
    add_data: 0,
    edit_data: 1,
    delete_data: 2,
    csv_export: 3,
  }
end
