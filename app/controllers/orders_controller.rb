class OrdersController < ApplicationController
    include CurrentCart
  before_action :set_cart, only: [:new, :create]
  # before_action :should_has_one_first_item, only: [:new, :create]
  # def should_has_one_first_item
  # end
  # POST /orders
  # POST /orders.json
  def create
    user = current_user
    @day = Day.last
    @order = @day.orders.build(user: user)
    @order.add_first_items_from_cart(@cart)
    # @order.add_second_items_from_cart(@cart)
    # @order.add_drink_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.js { }
        format.html { redirect_to user_root_path, notice:
            'Thank you for your order.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @order = Order.find(params[:id])
  #   @order.destroy
  #     respond_to do |format|
  #       format.html { redirect_to persons_profile_path }
  #       format.js  { }
  #   end
  # end

    def order_params
      params.require(:order).permit(:user_id, :day_id)
    end

end
