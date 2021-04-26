class User < ApplicationRecord
  has_many :equipments
  has_many :lendings
  has_many :operation_histories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:user_name]

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
