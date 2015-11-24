class PersonsController < ApplicationController
    include CurrentCart
  before_action :set_cart
  before_action :authenticate_user!#devise

  def profile
    @days = Day.all
    @first_item = FirstItem.new
  end

end
