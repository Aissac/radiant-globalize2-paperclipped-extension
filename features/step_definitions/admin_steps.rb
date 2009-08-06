Given /^I am logged in as an admin$/ do
  User.create!(:login => 'admin',
    :password => 'secret',
    :password_confirmation => 'secret',
    :name => 'Administrator',
    :admin => true)
  Given "I go to to \"the welcome page\""
  When "I fill in \"Username\" with \"admin\""
  When "I fill in \"Password\" with \"secret\""
  When "I press \"Login\""
end

Given /^an asset "([^\"]*)" exists$/ do |title|
  Factory.create(:asset, :title => title)
end