require "application_controller.rb"

class CompanyController < ApplicationController
  def create
    @company = Company.new
  end

  def new
    @company = Company.new
  end

  def save
    company = Company.create(params_company)
    redirect_to action: "show", id: company.id
  end

  def show
    @company = Company.find(params_id)
    #post("/company/#{params_id}") do
    #	@company = edit_params_company
    #end
  end

  def edit
    @company = Company.find(params_id)
  end

  def update
    param = params_company
    Company.update(params_id, params_company)
    #binding.pry
    redirect_to action: "show", id: params_id
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
