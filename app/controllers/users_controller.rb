class UsersController < ApplicationController
    load_and_authorize_resource

  def index
    @users = User.page(params[:page]).order("created_at DESC")
  end

  def show
    @orders = @user.orders.page(params[:page]).order("created_at DESC")
  end
end
