class EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.create(params_equipment)
  end

  def edit
    @equipment = Equipment.find(params_id)
  end

  def destroy
    @equipment = Equipment.delete(params_id)
  end


  private

  def params_id
    params.require(:id).to_i
  end

  def params_equipment
    params.require(:equipment)
  end

end
