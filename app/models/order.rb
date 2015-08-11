class Order < ActiveRecord::Base
  has_many :first_items
  has_many :second_items
  has_many :drinks_items

  belongs_to :user
  belongs_to :day
end
