class PersonsController < ApplicationController
    include CurrentCart
  before_action :set_cart

  def profile
    @days = Day.all
  end

end
