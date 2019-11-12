module SessionHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end


end
