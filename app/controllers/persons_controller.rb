class PersonsController < ApplicationController
    include CurrentCart
  before_action :set_cart

  def profile
    @days = Day.all
    @current_day = Day.last
  end
  def index
    @users = User.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end
end
