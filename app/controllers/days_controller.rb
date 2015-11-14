class DaysController < ApplicationController
  load_and_authorize_resource except: :create

  def index
    @days = Day.all
  end

  def show
    @orders = @day.orders.page(params[:page]).order("created_at DESC")
  end

  def new
    @day = Day.new
    @day.first_courses.build
    @day.second_courses.build
    @day.drinks.build
  end

  def create
    @day = Day.new(day_params)
    @day.user = current_user
    respond_to do |format|
      if @day.save
        Cart.destroy_all
        format.js
        # format.html { redirect_to days_path, notice: 'Menu is sucessfully created.' }
        format.html { redirect_to days_path, notice: t('.notice') }
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
