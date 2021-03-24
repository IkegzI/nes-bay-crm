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
    #tz4
    user = User.find((params[:user_id] || session[:user_id]).to_i)
    if user.name == "admin"
      @region = Region.all
    else
      @region = Region.where(id: user.region_id)
    end
    @type_machines = {}
    @name_machines = {}
    @region.ids.each do |region_id|
      company_ids = Company.where(region_id: region_id).ids

      #сработал медленнее
      # @type_machines[region_id] = Machine.where(id: Companies_Machines.where(company_id: company_ids).pluck(:machine_id)).includes(:type_machine).pluck('type_machines.id', 'type_machines.name').uniq

      # сработал быстрее
      @type_machines[region_id] = TypeMachine.where(
          id: Machine.where(
              id: Companies_Machines.where(
                  company_id: company_ids
              ).pluck(
                  :machine_id
              )
          ).pluck(
              :type_machine_id
          )
      ).pluck(
          'type_machines.id',
          'type_machines.name'
      )

    end
    #tz4
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
