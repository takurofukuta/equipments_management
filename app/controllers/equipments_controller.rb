class EquipmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_equipment,only: [:edit, :update, :destroy]
  require "csv"

  PER_PAGE = 20

  def index
    @q = Equipment.ransack(params[:q])
    @equipments = @q.result.page(params[:page]).per(PER_PAGE).order(created_at: "DESC")
    @equipment = Equipment.new
    @equipments_csv = Equipment.all

    respond_to do |format|
      format.html
      format.csv do |csv|
        send_equipments_csv(@equipments_csv)
      end
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def edit
  end

  def create
    @equipment = current_user.equipments.new(equipment_params)
    if @equipment.save
      OperationHistory.create_log(current_user.id, equipment_params[:lab_equipment_name], 0)
      redirect_to equipments_path, notice: "データを追加しました"
    else
      @q = Equipment.ransack(params[:q])
      @equipments = @q.result.page(params[:page]).per(PER_PAGE)
      flash.now[:alert] = "データの追加に失敗しました"
      render :index
    end
  end

  def update
    OperationHistory.create_log(current_user.id, @equipment.lab_equipment_name, 1)
    if @equipment.update(equipment_params)
      redirect_to equipment_path(params[:id]), notice: "データを更新しました"
    else
      flash.now[:alert] = "データの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @equipment.destroy!
    OperationHistory.create_log(current_user.id, @equipment.lab_equipment_name, 2)
    redirect_to root_path, alert: "データを削除しました"
  end

  private

  def equipment_params
    params.require(:equipment).permit(
      :genre,
      :lab_equipment_name,
      :maker_name,
      :product_name,
      :purchase_year,
      :asset_num,
      :price,
      :lendings_status,
      :disposal_status,
      :remarks
    )
  end

  def correct_equipment
    redirect_to root_path, alert: "権限がありません" unless current_user.admin
    @equipment = Equipment.find(params[:id])
  end

  def send_equipments_csv(equipments)
    csv_data = CSV.generate do |csv|
      column_names = %w(備品ジャンル 研究室用備品名 メーカー名 製品名 購入年度 資産番号 値段 データ追加日 データ追加者 備考)
      csv << column_names
      equipments.includes(:registered_user).each do |equipment|
        column_values = [
          equipment.genre_i18n,
          equipment.lab_equipment_name,
          equipment.maker_name,
          equipment.product_name,
          equipment.purchase_year,
          equipment.asset_num,
          equipment.price,
          equipment.created_at,
          equipment.registered_user.user_name,
          equipment.remarks
        ]
        csv << column_values
      end
    end
    time = Time.now
    send_data(csv_data, filename: "#{time.year}年#{time.month}月#{time.day}日#{time.hour}時#{time.min}分#{time.sec}秒時点_備品一覧.csv")
    OperationHistory.create_log(current_user.id, "備品データ", 3)
  end
end
