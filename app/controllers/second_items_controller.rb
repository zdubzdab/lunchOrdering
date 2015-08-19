class SecondItemsController < ApplicationController
include CurrentCart
before_action :set_cart, only: [:create]

def create
  second_course = SecondCourse.find(params[:second_course_id])
  @second_item = @cart.second_items.build(second_course: second_course)

  respond_to do |format|
    if @second_item.save
      format.html { redirect_to days_path }
      format.js {}
      format.json { render action: 'show',
          status: :created, location: @second_item }
    else
      format.html { render action: 'new' }
      format.js { render js: 'alert("You can order only one second course");' }
      format.json { render json: @second_item.errors, status: :unprocessable_entity }
    end
  end
end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def second_item_params
    params.require(:second_item).permit(:second_course_id, :cart_id)
  end
end

