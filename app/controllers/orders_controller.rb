class OrdersController < ApplicationController
  skip_before_filter :authorize, only: [:show, :new, :create, :user_orders]
  before_action :set_order, only: [:show, :edit, :update, :destroy, :ship]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.paginate page: params[:page], order: 'created_at desc', 
              per_page: 10
    
    respond_to do |format|
      format.html
      format.json { render json: @orders }  
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    if session[:user_permission] == 0 and @order.user.id != session[:user_id]
      redirect_to login_url, alert: "Permission denied. Your are not an administrator."
    end
  end

  # GET /orders/new
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, flash: {error: "Your cart is empty"}
      return
    end
    if session[:user_id] == nil
      redirect_to login_url, alert: "Please login before checkout"
      return
    end
    
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    @order.user_id = session[:user_id]

    respond_to do |format|
      if @order.save
        destroy_cart
        OrderNotifier.received(@order).deliver
        format.html { redirect_to store_url, notice: I18n.t('.thanks') }
        format.json { render action: @order, status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /orders/ship/:id
  def ship
    @order.status = 1;
    respond_to do |format|
      if @order.save
        OrderNotifier.shipped(@order).deliver
        format.html { redirect_to orders_url, notice: 'Products have been shipped.' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: I18n.t('.thanks') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
  
  # GET /orders/user_orders
  def user_orders
    @user = User.find(params[:id])
    @orders = @user.orders
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
