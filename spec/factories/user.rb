FactoryGirl.define do
  factory :admin, class: User do
    name                  "admin"
    email                 "admin@gmail.com"
    role                  "admin"
    password              "password"
    password_confirmation "password"
  end

  factory :user do
    name                  "user"
    email                 "user@gmail.com"
    role                  "user"
    password              "password"
    password_confirmation "password"
  end
end

