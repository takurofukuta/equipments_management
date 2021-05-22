class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :update

  def ensure_normal_user
    if resource.user_name == "guest_user"
      redirect_to root_path, alert: "ゲストユーザーの更新はできません。"
    end
  end
end