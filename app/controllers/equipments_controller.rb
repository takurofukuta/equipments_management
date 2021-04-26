class EquipmentsController < ApplicationController
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
end
