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
    @talk = @company.talks
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
    @company = Company.where(region_id: current_region)
  end

  def find_per_inst(item)
    @company = Instrument.find(params_id)
    render company_index_path
  end

  def index_filter
  end

  def link_destroy
    # param = params_link
    link_id = params_link[:id]
    obj = params_link[:what]
    company_id = params_id
    case
    when obj == 'Contact'
      Linkcontact.delete(Linkcontact.where(contact_id: link_id, company_id: company_id).ids)
    when obj == 'Instrument'
      Linkinstrument.delete(Linkinstrument.where(company_id: company_id, instrument_id: link_id).ids)
    when obj == 'Service'
      Linkservice.delete(Linkservice.where(company_id: company_id, service_id: link_id).ids)
    when obj == 'Spherework'
      Linkspherework.delete(Linkspherework.where(company_id: company_id, spherework_id: link_id).ids)
    end
    redirect_to edit_company_path(company_id)
  end

  def link_add
    # param = params_link
    link_id = params_link[:id]
    obj = params_link[:what]
    company_id = params_id
    case
    when obj == 'Contact'
      Company.find(company_id).contacts << Contact.find(link_id)
    when obj == 'Instrument'
      Company.find(company_id).instruments << Instrument.find(link_id)
    when obj == 'Service'
      Company.find(company_id).services << Service.find(link_id)
    when obj == 'Spherework'
      Company.find(company_id).sphereworks << Spherework.find(link_id)
    end
    redirect_to edit_company_path(company_id)
  end

  def talks
    @company = Company.find(params_id)
    @talk = @company.talks
  end

  private

  def params_link
    params.require(:link)
  end

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
     :status_id, :region_id, :user_id].each { |item| param[item] = '' }
    params.require(:company).permit(param.keys).each do |item|
      param[item[0].to_sym] = item[1]
    end
    param[:active] = param[:active] == '1' ? true : false

    return param
  end
end
