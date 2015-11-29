class RemoveNameFromDays < ActiveRecord::Migration
  def change
    remove_column :days, :name, :string
  end
end
