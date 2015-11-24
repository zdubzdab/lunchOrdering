class UsersController < ApplicationController
  before_action :authenticate_user!#devise
  load_and_authorize_resource#cancan

  def index
    @users = User.page(params[:page]).order("created_at DESC")
  end

  def show
    @orders = @user.orders.page(params[:page]).order("created_at DESC")
  end
end
