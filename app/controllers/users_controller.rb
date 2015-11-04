class UsersController < ApplicationController
    load_and_authorize_resource

  def index
    @users = User.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end

  def show
    @orders = @user.orders
  end
end
