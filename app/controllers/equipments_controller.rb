class EquipmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @equipments = Equipment.all
    @equipment = Equipment.new
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def create
    current_user.equipments.create!(equipment_params)
    redirect_to root_path
  end

  def update
    equipment = Equipment.find(params[:id])
    equipment.update!(equipment_params)
    redirect_to equipment
  end

  def destroy
    equipment = Equipment.find(params[:id])
    equipment.destroy!
    redirect_to root_path
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
end
