include ApplicationHelper

def valid_signin_admin(admin)
  fill_in "Email",    with: 'admin@gmail.com'
  fill_in "Password", with: "password"
  click_button "Log in"
end

def valid_signin_user(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
end

