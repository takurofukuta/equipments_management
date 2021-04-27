class Lending < ApplicationRecord
  belongs_to :user, foreign_key: :lending_user_id
  belongs_to :equipment, foreign_key: :borrowed_equipment_id
end
