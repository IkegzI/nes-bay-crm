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
    @type_machines = {}
    @name_machines = {}
    @region.ids.each do |region|
      company_id = Company.where(region_id: region)
      @type_machines[region] = Machine.where(id: Companies_Machines.where(company_id: company_id)).includes(:type_machine).pluck('type_machines.id', 'type_machines.name').uniq
      @name_machines[region] = Machine.where(type_machine_id: @type_machines[region].map{|i| i.first}).pluck(:name)
    end
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
