User.delete_all
User.create!(name: "admin",
             email: "a@a.a",
             role: "admin",
             password: "aaaaaaaa",
             password_confirmation: "aaaaaaaa")

5.times do |n|
  name  = Faker::Name.name
  email = "mail#{n+1}@gmai.org"
  password  = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

Day.delete_all
Day.create!(
  user_id: User.first.id,
  starts_at: Time.now)
#you should turn off validation in day.rb (user_quota)
10.times do |n|
  starts_at = (Time.now - (n+1).days)
  Day.create!(user_id: User.first.id,
              starts_at: starts_at)
end

FirstCourse.delete_all
Day.last(11).each do |k|
  2.times do
    name =  Faker::Lorem.word
    price = Faker::Number.decimal(1, 2)
    FirstCourse.create!(day_id: k.id, name: name, price: price )
  end
end

SecondCourse.delete_all
Day.last(11).each do |k|
  2.times do
    name =  Faker::Lorem.word
    price = Faker::Number.decimal(1, 2)
    SecondCourse.create!(day_id: k.id, name: name, price: price )
  end
end

Drink.delete_all
Day.last(11).each do |k|
  2.times do
    name =  Faker::Lorem.word
    price = Faker::Number.decimal(1, 2)
    Drink.create!(day_id: k.id, name: name, price: price )
  end
end

# Order.delete_all
# Day.last(11).each do |k|
#   User.last(5).each do |u|
#     Order.create!(day_id: k.id, user_id: u.id )
#   end
# end

# FirstItem.delete_all
# Order.last(55).each do |k|
#   User.last(5).each do |u|
#     FirstItem.create!(order_id: k.id, user_id: u.id )
#   end
# end