class PersonsController < ApplicationController
  def profile
  end
  def index
    @users = User.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end
end
