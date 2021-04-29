class LendingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lendings = Lending.where(lendings_status: 1).includes(:lending_user, :borrowed_equipment)
  end

  def lendings_history
    @lendings = Lending.all.includes(:lending_user, :borrowed_equipment)
  end

  #備品一覧ページの貸出ボタンを押した時の処理
  def lending
    equipment = Equipment.find(params[:id])
    equipment.lendings_status = 1
    equipment.save

    Lending.create!(lending_user_id: current_user.id, borrowed_equipment_id: equipment.id, lendings_status: 1)
    redirect_to root_path
  end

  #貸出状況ページの返却ボタンを押した時の処理
  def return
    lending = Lending.find(params[:id])
    lending.lendings_status = 0
    lending.save

    equipment = Equipment.find(lending.borrowed_equipment_id)
    equipment.lendings_status = 0
    equipment.save

    redirect_to lendings_path
  end
end
