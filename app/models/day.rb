class Day < ActiveRecord::Base
  has_many :orders
  has_many :first_items, through: :orders
  has_many :second_items, through: :orders
  has_many :drink_items, through: :orders
  has_many :first_courses, dependent: :destroy
  has_many :second_courses, dependent: :destroy
  has_many :drinks, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :first_courses, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :second_courses, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :drinks, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true

  validate :user_quota, :on => :create

  extend SimpleCalendar
  has_calendar

  private 
    def user_quota
      if user.days.today.count >= 5
        errors.add(:base, "You can create only one menu per day")
      end
    end
end
