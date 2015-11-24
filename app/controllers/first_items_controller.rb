class FirstItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def create
    first_course = FirstCourse.find(params[:first_course_id])
    @first_item = @cart.first_items.build(first_course: first_course)

    respond_to do |format|
      if @first_item.save
        format.html { redirect_to user_root_path }
        format.js {}
        format.json { render action: 'show',
            status: :created, location: @first_item }
      else
        format.html { render action: 'new' }
        format.js { render js: 'alert("You can order only one first course");' }
        format.json { render json: @first_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def first_item_params
      params.require(:first_item).permit(:first_course_id, :cart_id)
    end
end
