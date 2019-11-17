require "application_controller.rb"

class CompanyController < ApplicationController
  # def create
  #   @company = Company.new
  # end

  def new
    @company = Company.new
    @region = Region.all
  end

  def create
    company = Company.create(params_company)
    find_db_params_company.each do |clas|
      clas.last.each do |item|
        add_info_companies(company, clas.first, item)
      end
    end


    redirect_to session[:forward_url] || company_path(company)
  end

  def show
    @company = Company.find(params_id)
  end

  def edit
    @company = Company.find(params_id)
  end

  def update
    Company.update(params_id, params_company)
    redirect_to company_path(params_id)
  end

  def destroy
    Company.delete(params_id)
    redirect_to action: "index", message: "Удаление выполнено успешно"
  end

  def index
    @company = Company.all
  end

  def find_per_inst(item)
    @company = Instrument.find(params_id)
    render company_index_path
  end

  def index_filter
  end

  private

  def params_id
    params.require(:id).to_i
  end

  def find_db_params_company
    param = {}
    [:instrument, :service, :spherework, :contact].each do |item|
      param[item] = params.require(:company).require(item) if params.require(:company).include?(item.to_s)
    end
   param
  end


  def params_company
    param = {}
    [:name, :address, :phone, :equipment,
     :active, :email, :site,
     :status_id, :region_id, :user_id].each{|item| param[item] = ''}
    params.require(:company).permit(param.keys).each do |item|
      param[item[0].to_sym] = item[1]
    end
    param[:active] = param[:active] == '1' ? true : false

    return param
  end
end
