class AddDayRefToDrinks < ActiveRecord::Migration
  def change
    add_reference :drinks, :day, index: true
    add_foreign_key :drinks, :days
  end
end
