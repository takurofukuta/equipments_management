class Lending < ApplicationRecord
  belongs_to :lending_user, class_name: "User", foreign_key: :lending_user_id
  belongs_to :borrowed_equipment, class_name: "Equipment", foreign_key: :borrowed_equipment_id
  validates :lendings_status, presence: true
  validates :return_time, presence: true
  
end
