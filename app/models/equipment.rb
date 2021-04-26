class Equipment < ApplicationRecord
  has_one :lending, dependent: :destroy
  belongs_to :registered_user, optional: true, class_name: "User"
end
