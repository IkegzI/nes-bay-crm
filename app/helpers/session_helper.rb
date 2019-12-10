module SessionHelper


  def log_in(user)
    session[:user_id] = user.id
    session[:region_id] = user.region.id
    session[:role] = user.role.name
  end

  def current_user
    cookies
    session[:user_id]
  end

  def current_region
    cookies
    session[:region_id]
  end

  def current_role
    cookies
    session[:role]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in?
    unless logged_in?
      redirect_to login_path
    end
  end

  def url_request
      session[:forward_url] = request.url
  end

  def url_reset
    session[:forward_url] = nil
  end

end
