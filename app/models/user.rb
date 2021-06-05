class User < ApplicationRecord
  has_many :equipments, foreign_key: :registered_user_id
  has_many :lendings, foreign_key: :lending_user_id
  has_many :operation_histories, foreign_key: :operated_user_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:user_name]

  VALID_USER_NAME_REGEX = /\A[a-zA-Z0-9]+\z/.freeze

  validates :user_name, presence: true, uniqueness: true, length: { maximum: 30 }, format: { with: VALID_USER_NAME_REGEX }
  validates :last_name, presence: true, length: { maximum: 15 }
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :assignment_year, presence: true
  validates :encrypted_password, presence: true, format: { with: VALID_USER_NAME_REGEX }

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

  def self.guest
    find_or_create_by!(user_name: "guest_user", last_name: "ゲスト", first_name: "太郎", assignment_year: Time.current.year, admin: true) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
