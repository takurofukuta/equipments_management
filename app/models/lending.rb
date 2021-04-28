class Lending < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :lending_user_id
  belongs_to :equipment, class_name: "Equipment", foreign_key: :borrowed_equipment_id
end
