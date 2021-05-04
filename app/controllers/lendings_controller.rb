class LendingsController < ApplicationController
  before_action :authenticate_user!

  PER_PAGE = 20

  def index
    @q = Lending.ransack(params[:q])
    @lendings = @q.result.page(params[:page]).per(PER_PAGE).where(lendings_status: 1).includes(:lending_user, :borrowed_equipment).order(created_at: "DESC")
  end

  def lendings_history
    @q = Lending.ransack(params[:q])
    @lendings = @q.result.page(params[:page]).per(PER_PAGE).where(lendings_status: 0).includes(:lending_user, :borrowed_equipment).order(created_at: "DESC")
  end

  #備品一覧ページの貸出ボタンを押した時の処理
  def lending
    equipment = Equipment.find(params[:id])
    equipment.lendings_status = 1
    equipment.save

    Lending.create!(lending_user_id: current_user.id, borrowed_equipment_id: equipment.id, lendings_status: 1)
    redirect_to root_path, notice: "#{equipment.lab_equipment_name}を貸出しました"
  end

  #貸出状況ページの返却ボタンを押した時の処理
  def return
    lending = Lending.find(params[:id])
    lending.lendings_status = 0
    lending.return_time = Time.now
    lending.save

    equipment = Equipment.find(lending.borrowed_equipment_id)
    equipment.lendings_status = 0
    equipment.save

    redirect_to lendings_path, notice: "#{equipment.lab_equipment_name}を返却しました"
  end
end
