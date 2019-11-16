class ApplicationController < ActionController::Base
  include SessionHelper
  before_action :log_in?, unless: -> { params[:controller] == "session" }

end
