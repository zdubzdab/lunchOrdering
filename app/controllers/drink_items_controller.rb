class DrinkItemsController < ApplicationController
include CurrentCart
before_action :set_cart, only: [:create]

def create
  drink = Drink.find(params[:drink_id])
  @drink_item = @cart.drink_items.build(drink: drink)

  respond_to do |format|
    if @drink_item.save
      format.html { redirect_to days_path }
      format.js {}
      format.json { render action: 'show',
          status: :created, location: @drink_item }
    else
      format.html { render action: 'new' }
      format.json { render json: @drink_item.errors, status: :unprocessable_entity }
    end
  end
end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def drink_item_params
    params.require(:drink_item).permit(:drink_id, :cart_id)
  end
end