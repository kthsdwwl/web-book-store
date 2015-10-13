class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :set_i18n_locale_from_params
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def authorize
      unless User.find_by_id(session[:user_id]) and session[:user_permission] == 1
        redirect_to login_url, alert: "Permission denied. Your are not an administrator."
      end
    end
    
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
            logger.error flash.now[:notice]
        end
      end
    end
    
    def default_url_options
      { locale: I18n.locale }
    end

  private
    def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
    
    def destroy_cart
      if session[:cart_id]
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
      end
    end

end
