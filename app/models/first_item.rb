class FirstItem < ActiveRecord::Base
  belongs_to :first_course
  belongs_to :order
  belongs_to :day
  belongs_to :user
end
