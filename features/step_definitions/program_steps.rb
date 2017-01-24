# Steps for sufficency of program information

Given /^I have a program with all required information$/ do
  @program = FactoryGirl.build(:valid_program_with_name)
end

Given /^I have a program missing a date$/ do
  @program = FactoryGirl.build(:no_date_program)
end

Given /^I have a program missing a description$/ do
  @program = FactoryGirl.build(:no_description_program)
end

Given /^I have a program missing a name and has no image$/ do
  @program = FactoryGirl.build(:no_name_program)
end

Given /^I have a program with no house$/ do
  @program = FactoryGirl.build(:no_house_program)
end

Given /^I have a program with no program type$/ do
  @program = FactoryGirl.build(:no_program_type_program)
end

When /^I attempt to save that program$/ do
  @program_save_status = @program.save
end

Then /^the program save should succeed$/ do
  @program_save_status.should == true
  Program.count.should == 1
end

Then /^the program save should fail$/ do
  @program_save_status.should == false
  Program.count.should == 0
end

# Steps for Submitted, Approved and Rejected program scenarios

Given /^I have submitted a program$/ do
  @program = FactoryGirl.create(:valid_program_with_name)
  @program.status = "Submitted"
end

Given /^I have approved a program$/ do
  @program = FactoryGirl.create(:valid_program_with_name)
  @program.status = "Approved"
end

Given /^I have declined a program$/ do
  @program = FactoryGirl.create(:valid_program_with_name)
  @program.status = "Declined"
end

When /^I examine that program$/ do
  @status = @program.check_status
end

Then /^the numerical status of the program is one$/ do
  @status.should == "1"
end

Then /^the numerical status of the program is two$/ do
  @status.should == "2"
end

Then /^the numerical status of the program is three$/ do
  @status.should == "3"
end

Given /^I have a program with a date and a name$/ do
  @program = FactoryGirl.create(:valid_program_with_name)
end

When /^I ask for the date and name of that program$/ do
  @date_and_name = @program.date_and_name
end

Then /^the output should be the date and name of that program$/ do
  @date_and_name.should == "#{@program.date} - #{@program.name}"
end
