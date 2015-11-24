class CartsController < ApplicationController
  respond_to :html, :js
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def create
    @cart = Cart.new(cart_params)
    # respond_to do |format|
    #   if @cart.save
    #     format.html { redirect_to user_root_path }
    #     format.json { render action: 'show', status: :created, location: @cart }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @cart.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_with(@cart) do |format|
      format.js  { render nothing: true }
    end
  end

  private
    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to user_root_path, notice: 'Invalid cart'
    end
    def cart_params
      params.require(:cart).permit(:id)
    end
end
