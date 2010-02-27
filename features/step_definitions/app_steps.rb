Given /^there is an (admin|user) with the login of "([^\"]*)" and password "([^\"]*)"$/ do |type, login, password|
  u = User.find_by_login(login)
  u ||= User.create(:login => login, :password => password, :password_confirmation => password)
  u.admin = type == "admin"
  # Ensure the password is set
  u.password = u.password_confirmation = password
  u.save!
end
