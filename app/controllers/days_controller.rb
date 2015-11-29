class DaysController < ApplicationController
  # load_and_authorize_resource except: :create
  before_action :authenticate_user!#devise

  def index
    authorize! :index, @day
    @days = Day.all
  end

  def show
    authorize! :show, @day
    @day = Day.find(params[:id])
    @orders = @day.orders.page(params[:page]).order("created_at DESC")
  end

  def new
    authorize! :new, @day
    @day = Day.new
    @day.first_courses.build
    @day.second_courses.build
    @day.drinks.build
  end

  def create
    authorize! :create, @day
    @day = Day.new(day_params)
    @day.user = current_user
    respond_to do |format|
      if @day.save
        Cart.destroy_all
        format.js
        format.html { redirect_to days_path, notice: t('.sucessful') }
      else
        format.html { render :new }
        format.js
      end
    end
  end

  private

    def day_params
      params.require(:day).permit(:name, :starts_at, :user_id, first_courses_attributes: [:id, :name, :price, :_destroy], second_courses_attributes: [:id, :name, :price, :_destroy], drinks_attributes: [:id, :name, :price, :_destroy])
    end
end
