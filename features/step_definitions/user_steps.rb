# Steps for sufficency of user information

Given /^I have a user with all required information$/ do
  @user = FactoryGirl.build(:savable_user)
end

Given /^I have a user all required information except a sign in count$/ do
  @user = FactoryGirl.build(:no_set_sign_in_count_user)
end

Given /^I have a user missing an email$/ do
  @user = FactoryGirl.build(:no_email_user)
end

Given /^I have a user with a malformed email$/ do
    @user = FactoryGirl.build(:bad_email_user)
end

Given /^I have a user missing a password$/ do
  @user = FactoryGirl.build(:no_password_user)
end

Given /^I have a user with a five character password$/ do
  @user = FactoryGirl.build(:short_password_user)
end

Given /^I have a user missing a first name$/ do
   @user = FactoryGirl.build(:no_first_name_user)
end

Given /^I have a user missing a last name$/ do
  @user = FactoryGirl.build(:no_last_name_user)
end

Given /^I have a user missing a role$/ do
  @user = FactoryGirl.build(:no_role_user)
end

When /^I attempt to save that user$/ do
  @user_save_status = @user.save
end

Then /^the user save should succeed$/ do
  @user_save_status.should == true
  User.count.should == 1
end

Then /^the sign in count should be zero$/ do
  @user.sign_in_count.should == 0
end

Then /^the user save should fail$/ do
  @user_save_status.should == false
  User.count.should == 0
end

# Steps for fullname, firstname, etc. user scenarios

Given /^I have an existing user$/ do
  @user = FactoryGirl.create(:savable_user)
end

When /^I request the full name of that user$/ do
  @full_name = @user.fullname
end

When /^I request the first and last name of that user$/ do
  @first_and_last_name = @user.firstlast
end

Then /^the name should be formatted with last name first$/ do
  @full_name.should == "User, Example"
end

Then /^the name should be formatted with first name followed by last name$/ do
  @first_and_last_name.should == "Example User"
end

Given /^I have a user who did not capitalize her name$/ do
  @user = FactoryGirl.create(:funny_case_user)
end

Then /^the both the first and last name should be capitalized$/ do
  @first_and_last_name.should == "Example User"
end

Given /^I have a user who capitalized his email$/ do
  @user = FactoryGirl.create(:funny_case_user)
end

When /^I request the email that user$/ do
  @user_email = @user.email
end

Then /^the email should be in lower case$/ do
  @user_email.should == "user@example.com"
end

Given /^I have an existing user without a specified image$/ do
  @user = FactoryGirl.create(:savable_user)
end

When /^I request the image for that user$/ do
  @user_image = @user.avatar_legacy
end

Then /^the image should be the default Moishe House image$/ do
  # Could make below into one Regex if wanted
  @user_image.should include "http://moishehouse.org/data/photos/residents/"
  @user_image.should include "jpg"
end
