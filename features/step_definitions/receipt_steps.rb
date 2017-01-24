# Steps for Submitted, Approved and Rejected receipt scenarios

Given /^I have submitted a receipt$/ do
  @receipt = FactoryGirl.create(:valid_receipt)
end

Given /^I have approved a receipt$/ do
  @receipt = FactoryGirl.create(:valid_receipt)
  @receipt.status = "2"
end

Given /^I have rejected a receipt$/ do
  @receipt = FactoryGirl.create(:valid_receipt)
  @receipt.status = "3"
end

When /^I examine that receipt$/ do
  @status = @receipt.status_name
  @status_color = @receipt.row_color
  @status_html = @receipt.status_name_html
  @status_button_color = @receipt.button_color
end

Then /^the status of the receipt is submitted$/ do
  @status.should == "Submitted"
end

Then /^the status of the receipt is rejected$/ do
    @status.should == "Rejected"
end

Then /^the status of the receipt is approved$/ do
  @status.should == "Approved"
end

Then /^the receipt is an informational color$/ do
  @status_color.should == "info"
end

Then /^the receipt is a successful color$/ do
  @status_color.should == "success"
end

Then /^the receipt is a error color$/ do
  @status_color.should == "error" 
end

Then /^the generated HTML displays Submitted$/ do
  @status_html.should include('Submitted')
end

Then /^the generated HTML displays Approved$/ do
  @status_html.should include('Approved')
end

Then /^the generated HTML displays Rejected$/ do
  @status_html.should include('Rejected')
end

Then /^the button color is primary$/ do
  @status_button_color.should include('btn-primary')
end

Then /^the button color is success$/ do
  @status_button_color.should include('btn-success')
end

Then /^the button color is danger$/ do
  @status_button_color.should include('btn-danger')
end

# Steps for sufficency of receipt information

Given /^I have a receipt with all required information$/ do
  @receipt = FactoryGirl.build(:valid_receipt)
end

Given /^I have a receipt missing an amount$/ do
  @receipt = FactoryGirl.build(:no_amount_receipt)
end

Given /^I have a receipt with a negative amount$/ do
  @receipt = FactoryGirl.build(:negative_amount_receipt)
end

Given /^I have a receipt missing a status$/ do
  @receipt = FactoryGirl.build(:no_status_receipt)
end

Given /^I have a receipt missing a program$/ do
  @receipt = FactoryGirl.build(:no_program_receipt)
end

Given /^I have a receipt with no submitter$/ do
  @receipt = FactoryGirl.build(:no_submitter_receipt)
end

Given /^I have a receipt with no purchaser$/ do
  @receipt = FactoryGirl.build(:no_purchaser_receipt)
end

Given /^I have a receipt with no purpose$/ do
  @receipt = FactoryGirl.build(:no_purpose_receipt)
end

When /^I attempt to save that receipt$/ do
  @receipt_save_status = @receipt.save
end

Then /^the receipt save should succeed$/ do
  @receipt_save_status.should == true
  Receipt.count.should == 1
end

Then /^the receipt save should fail$/ do
  @receipt_save_status.should == false
  Receipt.count.should == 0
end