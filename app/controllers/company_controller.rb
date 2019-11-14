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
    binding.pry
    company = Company.create(params_company)
    redirect_to company_path(company)

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

  private

  def params_id
    params.require(:id).to_i
  end


  def params_company
    param = {}
    params.require(:company).each { |item| param[item[0].to_sym] = item[1] }
    return param
  end
end
