class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :require_login
 
  protected
  
  def require_login
    unless session[:user_id]
      render :text => "not logged in", :status => 401
    end
  end

  def json_request?
    request.format.json?
  end

  def is_staff
	unless session[:staff]
	  render :text => "not authorised", :status => 401
	end
  end
end
