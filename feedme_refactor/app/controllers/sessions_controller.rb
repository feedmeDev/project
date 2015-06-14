class SessionsController < ApplicationController
skip_before_action :require_login
  
  def login_staff
    @person = Person.find_by(username: params[:username], staff: true).try(:authenticate, params[:password])
  
    if(@person != false && @person != nil)
      session[:user_id] = @person.id
      session[:staff] = @person.staff
      render json: @person
    else
      render :text => "not_found", :status => 401
    end
  end

  #needs username and password
  #returns a user
  # POST /login/customer
  # POST /login/customer.json
  def login_customer

    @person = Person.find_by(username: params[:username], staff: false).try(:authenticate, params[:password])

    if(@person != false && @person != nil)
      session[:user_id] = @person.id
      session[:staff] = @person.staff
      render json: @person
    else
      render :text => "not_found", :status => 401
    end
  end

  #logs the user out
  #returns text
  #POST /logout
  def logout
    reset_session
    render :text => "logged out", :status => 200
  end
end
