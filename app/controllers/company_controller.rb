require 'application_controller.rb'
class CompanyController < ApplicationController

  def create
    @company = Company.new
  end

  def show
    @company = Company.find(id_company)
    post("/company/#{id_company}") do
    company = edit_params_company
      debugger

    end

  end

  def edit
    @company = Company.find(id_company)
  end

  def update
    param =  edit_params_company
    edit_params = {}
    
    binding.pry

  end

  def delete
  end

  def index
    @company  = Company.all
  end



  private

  def id_company
    params.require(:id).to_i
  end

  def edit_params_company
    params.require(:company)
  end

end
