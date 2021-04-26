class Lending < ApplicationRecord
  belongs_to :lending_user, optional: true, class_name: "User"
  belongs_to :borrowed_equipment, optional: true, class_name: "User"
end
