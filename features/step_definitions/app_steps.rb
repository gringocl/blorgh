Given /^there is an (admin|user) with the login of "([^\"]*)" and password "([^\"]*)"$/ do |type, login, password|
  u = User.find_by_login(login)
  u ||= User.create(:login => login, :password => password, :password_confirmation => password)
  u.admin = type == "admin"
  # Ensure the password is set
  u.password = u.password_confirmation = password
  u.save!
end

Given /^the usual setup$/ do
  Post.delete_all
  u = User.find_by_login("admin") || User.make(:admin)
  u.admin = true
  u.save!
  
  User.find_by_login("user") || User.make(:user)
end

Given /^I am logged in as "([^\"]*)" with the password "([^\"]*)"$/ do |login, password|
  steps(%Q{
    Given I am on the homepage
    When I follow "Login"
    And I fill in "Login" with "#{login}"
    And I fill in "Password" with "#{password}"
    And I press "Login"
    Then I should see "You have been logged in."
  })
end

Given /^time is frozen$/ do
  Time.stubs(:now).returns("01-01-2010 01:23:45".to_time)
end


When /^I follow the (.*?) link for the (.*?) called "([^\"]*)"$/ do |link_name, type, lookup|
  klass = type.classify.constantize
  if klass == Post
    object = klass.find_by_title!(lookup)
    steps(%Q{When I follow "#{link_name}_#{type}_#{object.id}"})
  else
    raise "I don't know how to look for a #{klass}!"
  end
end

Then /^I should see "([^\"]*)" before "([^\"]*)"$/ do |first, last|
  Nokogiri::HTML(response.body).text.should match(/#{first}(.*?)#{last}/mis)
end

