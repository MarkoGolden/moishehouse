### UTILITY METHODS ###

def create_visitor
  @visitor_email    = "user@example.com"
  @visitor_password = "dummy1"
end

def create_resident_user
  @user = User.find_by_email @visitor_email
  if @user.nil?
    @user = FactoryGirl.create(:savable_user)
  end
end

def create_mhwow_user
  @user = User.find_by_email @visitor_email
  if @user.nil?
    @user = FactoryGirl.create(:savable_mhwow_user)
  end
end

def create_admin_user
  @user = User.find_by_email @visitor_email
  if @user.nil?
    @user = FactoryGirl.create(:savable_admin_user)
  end
end

def find_user
  @user ||= User.where("email = #{visitor_email}").first
end

def delete_user
  @user = User.find_by_email @visitor_email
  @user.destroy unless @user.nil?
end

def sign_in
  visit   '/mintranet'
  fill_in "user_email", :with => @visitor_email
  fill_in "user_password", :with => @visitor_password
  click_button "sign_in_button"
end

def sign_in_with_wrong_email
  visit   '/mintranet'
  fill_in "user_email", :with => "junk@example.com"
  fill_in "user_password", :with => @visitor_password
  click_button "sign_in_button"
end

def sign_in_with_wrong_password
  visit   '/mintranet'
  fill_in "user_email", :with => @visitor_email
  fill_in "user_password", :with => "junkjunk"
  click_button "sign_in_button"
end

## GIVEN ###

Given /^I exist as a Resident user$/ do
  create_visitor
  create_resident_user
end

Given /^I exist as a MHWOW user$/ do
  create_visitor
  create_mhwow_user
end

Given /^I exist as a Admin user$/ do
  create_visitor
  create_admin_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I am not logged in$/ do
  # Think this is Devise routing magic that forces a sign out
  # since this view doesn't actually appear
  visit '/users/sign_out'
end

When /^I sign in$/ do
  sign_in
end

When /^I sign in with a wrong email$/ do
  sign_in_with_wrong_email
end

When /^I sign in with a wrong password$/ do
  sign_in_with_wrong_password
end

Then /^I should be on the page for Residents$/ do
  page.should have_content "View Budget"
end

Then /^I should be on the page for MHWOW$/ do
  page.should have_content "Scholarship Form"
end

Then /^I should be on the page for Admins$/ do
  page.should have_content "Admin"
end

When /^I return to the site$/ do
  visit '/mintranet'
end

Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Forgot your password?"
end

Then /^I see an invalid email or password message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should be signed out$/ do
  page.find_by_id("sign_in_button")
  page.should_not have_content "EAST COAST OFFICE"
  page.should_not have_content "Logout"
end

# Implement later - maybe - if flash message is to be added
    
# 
# Then /^I see a successful sign in message$/ do
#   pending # express the regexp above with the code you wish you had
# end