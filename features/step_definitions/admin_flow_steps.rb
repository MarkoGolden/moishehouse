# require_relative 'user_steps'

Given /^I am a valid admin and logged in$/ do
  create_visitor
  create_admin_user
  sign_in
  page.should have_content "Admin"
end

When /^I create a new house without a physical location$/ do
  click_link "houses_anchor"
  page.should have_content "This is where the magic happens."
  # Above fails because of bug in app that sends it to wrong page
  # When bug is fixed. Uncommenet below steps
  # click_link "Create New House"
  # page.should have_content "Basic Info"
  # fill_in 'City', with: 'Rockville'
  # fill_in 'State/Country', with: 'MD'
  # select 'US East', from: 'Region'
end


When /^I create a new resident with user full info$/ do
  click_link "User List"
  page.should have_content "The people who make it happen."
  click_link "Create New User"
  page.should have_content "Basic Info"
  fill_in 'Email', with: 'resident@example.com'
  fill_in 'Password', with: 'IloveMoisheHouse'
  fill_in 'First name', with: 'Example'
  fill_in 'Last name', with: 'Resident'
  fill_in 'Mail address', with: '1600 Pennsylvania Ave NW'
  fill_in 'Mail city', with: 'Washington'  
  fill_in 'Mail state', with: 'DC'
  fill_in 'Mail zip', with: '20500'
  # Add what ever else needs filling in, selecting or checking
  # except house which is done in next step
end

When /^I assign that resident to that house$/ do
  pending # express the regexp above with the code you wish you had
  # Something along these lines, but you may need to fiddle with the 
  # Capybara format
  # select 'Rockville, MD', from: 'House'
  # click_button "Save"
end

When /^I do not assign that resident to any house$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see that house displayed$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see that resident displayed$/ do
  pending # express the regexp above with the code you wish you had
  # Check that the resident info is there - something like
  # page.should have_content "Example Resident"
end

Then /^resident user should be associated with that house$/ do
  pending # express the regexp above with the code you wish you had
  # Check that the expected house content for the page is displayed
end

Then /^I should not see that resident displayed$/ do
  pending # express the regexp above with the code you wish you had
  # Check that the resident info is NOT there - something like
  # page.should have_content "Example Resident"
end

Then /^I should see a failed to create user error message$/ do
  pending # express the regexp above with the code you wish you had
  # Check for whatever error message should be displayed here
  # App needs lots of error messages and has little or none 
end
# 
#   # To debug capybara when needed
  # print page.html