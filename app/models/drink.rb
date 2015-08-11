class Drink < ActiveRecord::Base
  has_many :drinks_items

  belongs_to :day
end
