module SessionHelper


  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    cookies
    session[:user_id]
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
