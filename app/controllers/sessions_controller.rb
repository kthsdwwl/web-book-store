class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      store_session user
      user.set_user_cart current_cart
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    delete_session
    destroy_cart
    redirect_to store_url, notice: "Logged out"
  end
  
  private
    def store_session(user)
      session[:user_id] = user.id
      session[:user_name] = user.name
      session[:user_permission] = user.permission
    end 
    
    def delete_session
      session[:user_id] = nil
      session[:user_name] = nil
      session[:user_permission] = nil
    end
end
