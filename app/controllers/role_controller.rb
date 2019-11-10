class RoleController < ApplicationController
  def create
    unless params_role.nil?
      role = Role.new(params_role)
      if role.save
        redirect_to role_index_path
      end
    end
  end

  def index
    @role = Role.all
  end

  def show
    @role = Role.find(params_id)
  end

  def edit
    @role = Role.find(params_id)
  end

  def update
    param = params_role
    Role.update(params_id, params_role)
    #binding.pry
    redirect_to role_path(params_id)
  end

  def destroy
    Role.delete(params_id)
    redirect_to role_index_path
  end

  private

  def params_role
    param ={}
    params.require(:role).each { |item| param[item[0].to_sym] = item[1] } unless params.require(:role).nil?
    param
  end

  def params_id
    params.require(:id).to_i
  end

end
