class OrdersController < ApplicationController
    include CurrentCart
  before_action :set_cart, only: [:create]

  # POST /orders
  # POST /orders.json
  def create
    user = current_user
    @day = Day.last
    @order = @day.orders.build(user: user)
    @order.add_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.js { }
        format.html { redirect_to user_root_path, notice:
            'Thank you for your order.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.js { render js: 'alert("Your order should has at least one item");'}
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

    def order_params
      params.require(:order).permit(:user_id, :day_id)
    end

end
