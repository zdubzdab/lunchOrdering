class PersonsController < ApplicationController
    include CurrentCart
  before_action :set_cart
  before_action :authenticate_user!#devise

  def profile
    @days = Day.all
    @first_course = FirstCourse.find_by(id: session[:first_course_id])
    @second_course = SecondCourse.find_by(id: session[:second_course_id])
    @drink = Drink.find_by(id: session[:drink_id])
  end

  def create_cart
    if params[:first_course_id].present?
      first_course = FirstCourse.find(params[:first_course_id])
      session[:first_course_id] = first_course.id
    else
      session[:first_course_id] = nil
    end
    if params[:second_course_id].present?
      second_course = SecondCourse.find(params[:second_course_id])
      session[:second_course_id] = second_course.id
    else
      session[:second_course_id] = nil
    end
    if params[:drink_id].present?
      drink = Drink.find(params[:drink_id])
      session[:drink_id] = drink.id
    else
      session[:drink_id] = nil
    end
    # session[:user_id] = current_user.id
    respond_to do |format|
        format.html { redirect_to user_root_path }
        # format.js {render nothing: true }
    end
  end

  # def delete_session
  #   session[:first_course_id] = nil
  #   session[:second_course_id] = nil
  #   session[:drink_id] = nil
  # end

end
