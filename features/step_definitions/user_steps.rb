Given /^there is a user with email address "([^\"]*)" and password "([^\"]*)"$/ do |email, password|
  User.create!(:email => email, :password => password)
end