require 'cucumber/rspec/doubles'

### UTILITY METHODS ###

def create_mock_date_for_today
  d = Date.parse("01/01/2014")
  Date.should_receive(:today).at_least(:once).and_return(d)
end


# Steps for sufficency of user information

Given /^I have a house with all required information$/ do
  @house = FactoryGirl.build(:savable_house)
end

Given /^I have a house without a city$/ do
  @house = FactoryGirl.build(:no_city_house)
end

Given /^I have a house without a state$/ do
  @house = FactoryGirl.build(:no_state_house)
end

When /^I attempt to save that house$/ do
  @house_save_status = @house.save
end

Then /^the house save should succeed$/ do
  @house_save_status.should == true
  House.count.should == 1
end

Then /^the house save should fail$/ do
  @house_save_status.should == false
  House.count.should == 0
end

# Steps for month range scenarios

Given /^I have an existing house$/ do
  @house = FactoryGirl.create(:savable_house)
end

When /^I request the one month range$/ do
  create_mock_date_for_today
  @end_of_month = @house.one_month_range
end

When /^I request the two month range$/ do
  create_mock_date_for_today
  @end_of_month = @house.two_months_range
end

When /^I request the next month range$/ do
  create_mock_date_for_today
  @end_of_month = @house.next_month_range
end

When /^I request the previous month range$/ do
  create_mock_date_for_today
  @end_of_month = @house.previous_month_range
end

Then /^the last day of this month should be the end date$/ do
  @end_of_month.to_s.should == '2014-01-31'
end

Then /^the last day of two months prior should be the end date$/ do
  @end_of_month.to_s.should == '2013-11-30'
end

Then /^the first day of next month should be the end date$/ do
  @end_of_month.to_s.should == '2014-02-01'
end

Then /^the first day of this month should be the end date$/ do
  @end_of_month.to_s.should == '2014-01-01'
end
