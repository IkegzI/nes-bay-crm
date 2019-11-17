class ApplicationController < ActionController::Base
  include SessionHelper
  include CompanyHelper
  before_action :log_in?, unless: -> { params[:controller] == "session" }
  before_action :url_request, if: -> { params[:controller] == "talk" }
  after_action :url_reset
end
