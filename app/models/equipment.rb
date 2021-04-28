class Equipment < ApplicationRecord
  has_one :lending, class_name: "Lending"
  belongs_to :registered_user, class_name: "User", foreign_key: :registered_user_id

  validates :genre, presence: true
  validates :lab_equipment_name, presence: true
  validates :maker_name, presence: true
  validates :product_name, presence: true
  validates :purchase_year, presence: true

  enum genre: {
    pc: 0,
    note_pc: 1,
    tera: 2,
    camera: 3,
    experiment: 4,
    others: 5,
  }
end
