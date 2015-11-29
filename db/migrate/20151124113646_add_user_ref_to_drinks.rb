class AddUserRefToDrinks < ActiveRecord::Migration
  def change
    add_reference :drinks, :user, index: true
    add_foreign_key :drinks, :users
  end
end
