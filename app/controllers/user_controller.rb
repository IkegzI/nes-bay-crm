class UserController < ApplicationController
  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find(params_id)
  end

  def index
    binding.pry
    @user = User.where(region_id: current_region)
  end

  def destroy
    User.delete(params_id)
    redirect_to user_index_path
  end

  def edit
    @user = User.find(params_id)
  end

  def update
    User.update(params_id, params_user)
    redirect_to user_path(@user)
  end

  private

  def params_id
    params.require(:id).to_i
  end

  def params_user
    param = {}
    params.require(:user).each { |item| param[item[0].to_sym] = item[1] }
    param
  end


end
