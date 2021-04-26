class Equipment < ApplicationRecord
  belongs_to :registered_user, optional: true, class_name: "User"
end
