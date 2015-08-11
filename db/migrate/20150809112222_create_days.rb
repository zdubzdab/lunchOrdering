class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :name
      t.datetime :starts_at
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :days, :users
  end
end
