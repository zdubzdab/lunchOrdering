class DaysController < ApplicationController
  load_and_authorize_resource except: :create
  before_action :set_day, only: [:show, :edit, :update, :destroy]
    include CurrentCart
  before_action :set_cart, only: [:create]

  def index
    @days = Day.all

  end

  def show

  end

  def new
    @day = Day.new
    @day.first_courses.build
    @day.second_courses.build
    @day.drinks.build
  end

  def edit
  end

  def create
    @day = Day.new(day_params)
    @day.user = current_user
    respond_to do |format|
      if @day.save
        format.js
        format.html { redirect_to days_path, notice: 'Menu is sucessfully created.' }
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update

    if @day.update(day_params)
      redirect_to days_path
    else
      render 'edit'
    end
  end

  def destroy
    @day.destroy

  end

  private
    def set_day
      @day = Day.find(params[:id])
    end

    def day_params
      params.require(:day).permit(:name, :starts_at, :user_id, first_courses_attributes: [:id, :name, :price, :_destroy], second_courses_attributes: [:id, :name, :price, :_destroy], drinks_attributes: [:id, :name, :price, :_destroy])
    end
end
