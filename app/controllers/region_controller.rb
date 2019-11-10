class RegionController < ApplicationController
  def new
    @region = Region.new
  end

  def create
    @region = Region.new(param_region)
    if @region.save
      redirect_to region_index_path
    end
  end

  def index
    @region = Region.all
  end

  def destroy
    Region.delete(params_id)
    redirect_to region_index_path
  end

  def show
    @region = Region.find(params_id)
  end

  def edit
    @region = Region.find(params_id)
  end

  def update
    Region.update(params_id, param_region)
    redirect_to region_path(params_id)
  end


  private

  def params_id
    params.require(:id).to_i
  end

  def param_region
    param = {}
    params.require(:region).each { |item| param[item[0].to_sym] = item[1] }
    return param
  end


end
