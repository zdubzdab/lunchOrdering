class OrdersController < ApplicationController
    include CurrentCart
  before_action :set_cart, only: [:create]

  # POST /orders
  # POST /orders.json
  def create
    day = Day.last
    if params[:first_course_id].present?
      first_course = FirstCourse.find(params[:first_course_id])
    end
    if params[:second_course_id].present?
      second_course = SecondCourse.find(params[:second_course_id])
    end
    if params[:drink_id].present?
      drink = Drink.find(params[:drink_id])
    end

    @order = Order.create(day_id: day.id, user: current_user, first_course_id: first_course.id,
                           second_course_id: second_course.id, drink_id: drink.id)

    respond_to do |format|
      if @order.save
        session[:first_course_id] = nil
        session[:second_course_id] = nil
        session[:drink_id] = nil
        format.js { }
        format.html { redirect_to user_root_path, notice: 'Thank you for your order.' }
        # format.html { redirect_to user_root_path, notice: '.notice'}
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.js { render js: 'alert("Your order is empty or there are courses which are not in today menu");'}
        # format.html { render partial: "cart" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

    def order_params
      params.require(:order).permit(:user_id, :day_id)
    end

end
