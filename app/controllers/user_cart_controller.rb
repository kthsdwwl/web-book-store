class UserCartController < ApplicationController
  skip_before_filter :authorize
  
  def show_user_cart
    @user_cart = current_cart
  end
end
