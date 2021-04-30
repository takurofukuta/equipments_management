class OperationHistory < ApplicationRecord
  belongs_to :operated_user, class_name: "User", foreign_key: :operated_user_id

  class << self
    def create_log(operated_user_id, lab_equipment_name, content)
      OperationHistory.create!(operated_user_id: operated_user_id, lab_equipment_name: lab_equipment_name, content: content)
    end
  end

  enum content: {
    add_data: 0,
    edit_data: 1,
    delete_data: 2,
    csv_export: 3,
  }
end
