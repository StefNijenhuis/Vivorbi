class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :allow_cross_domain_access
  def allow_cross_domain_access
	response.headers["Acces-Control-Allow-Origin"] = "*"
	response.headers["Acces-Control-Allow-Methods"] = "GET"
	response.headers["Access-Control-Allow-Headers"] = "Api-Key"
  end
end
