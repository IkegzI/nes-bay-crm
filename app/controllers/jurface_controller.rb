class JurfaceController < ApplicationController
  def new
  end

  def create
    jurface = Jurface.new(params_jurface)
    jurface.save
  end

  def edit
    @jurface = Jurface.find(params_id)
  end

  def update
    jurface = Jurface.find(params_id)
    jurface.update(params_jurface)
  end

  def destroy
  end

  private

  def params_jurface
    params.require(:jurface).permit(:name, :inn, :acc, :company_id)
  end

  def params_id
    params.require(:id)
  end

end
