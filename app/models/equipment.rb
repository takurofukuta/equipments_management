class Equipment < ApplicationRecord
  has_one :lending, dependent: :destroy
  belongs_to :registered_user, optional: true, class_name: "User"

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
