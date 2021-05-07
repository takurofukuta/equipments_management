class User < ApplicationRecord
  has_many :equipments, foreign_key: :registered_user_id
  has_many :lendings, foreign_key: :lending_user_id
  has_many :operation_histories, foreign_key: :operated_user_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:user_name]

  validates :user_name, uniqueness: true

  # No use email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
