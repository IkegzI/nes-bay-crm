class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login: params_session[:login].downcase)
    if user && user.pass == params_session[:pass]
      log_in(user)
      redirect_to user
    else
      redirect_to root_path
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end

  private

  def params_id
    params.require(:id).to_i
  end

  def params_session
    param = {}
    params.require(:session).each { |item| param[item[0].to_sym] = item[1] }
    param
  end


end
