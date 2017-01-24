# Steps for Expired and Unexpired grant scenarios

Given /^I have a grant that has expired$/ do
  @grant = FactoryGirl.create(:expired_grant)
end

Given /^I have a grant that has not expired$/ do
  @grant = FactoryGirl.create(:unexpired_grant)
end

When /^I examine the color of that grant$/ do
  @indicator = @grant.rowcolor
end

Then /^I should have an expired color$/ do
  @indicator.should == "warning"
end

Then /^I should have a current color$/ do
  @indicator.should == "success"
end

# Steps for sufficency of grant information

Given /^I have a grant with all required information$/ do
  @grant = FactoryGirl.build(:savable_grant)
end

Given /^I have a grant missing a name$/ do
  @grant = FactoryGirl.build(:no_name_grant)
end

Given /^I have a grant missing a description$/ do
  @grant = FactoryGirl.build(:no_description_grant)
end

Given /^I have a grant missing an amount$/ do
  @grant = FactoryGirl.build(:no_amount_grant)
end

Given /^I have a grant missing an expiration date$/ do
  @grant = FactoryGirl.build(:no_expires_grant)
end

When /^I attempt to save that grant$/ do
  @grant_save_status = @grant.save
end

Then /^the grant save should succeed$/ do
  @grant_save_status.should == true
  Grant.count.should == 1
end

Then /^the grant save should fail$/ do
  @grant_save_status.should == false
  Grant.count.should == 0
end
