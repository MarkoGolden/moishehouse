require 'test_helper'

class HousesControllerTest < ActionController::TestCase
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post :create, house: { active: @house.active, brn: @house.brn, budget_cleaning: @house.budget_cleaning, budget_program: @house.budget_program, calendar: @house.calendar, city: @house.city, contact_email: @house.contact_email, contact_phone: @house.contact_phone, country: @house.country, mail_address: @house.mail_address, mail_city: @house.mail_city, mail_instructions: @house.mail_instructions, mail_international: @house.mail_international, mail_state: @house.mail_state, mail_zip: @house.mail_zip, opened_date: @house.opened_date, programs_per_month: @house.programs_per_month, region: @house.region, rent_address: @house.rent_address, rent_city: @house.rent_city, rent_instructions: @house.rent_instructions, rent_name: @house.rent_name, rent_name_on_check: @house.rent_name_on_check, rent_state: @house.rent_state, rent_subsidy: @house.rent_subsidy, rent_total: @house.rent_total, rent_zip: @house.rent_zip, rsj: @house.rsj, state: @house.state, web_description: @house.web_description, website: @house.website }
    end

    assert_redirected_to house_path(assigns(:house))
  end

  test "should show house" do
    get :show, id: @house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @house
    assert_response :success
  end

  test "should update house" do
    put :update, id: @house, house: { active: @house.active, brn: @house.brn, budget_cleaning: @house.budget_cleaning, budget_program: @house.budget_program, calendar: @house.calendar, city: @house.city, contact_email: @house.contact_email, contact_phone: @house.contact_phone, country: @house.country, mail_address: @house.mail_address, mail_city: @house.mail_city, mail_instructions: @house.mail_instructions, mail_international: @house.mail_international, mail_state: @house.mail_state, mail_zip: @house.mail_zip, opened_date: @house.opened_date, programs_per_month: @house.programs_per_month, region: @house.region, rent_address: @house.rent_address, rent_city: @house.rent_city, rent_instructions: @house.rent_instructions, rent_name: @house.rent_name, rent_name_on_check: @house.rent_name_on_check, rent_state: @house.rent_state, rent_subsidy: @house.rent_subsidy, rent_total: @house.rent_total, rent_zip: @house.rent_zip, rsj: @house.rsj, state: @house.state, web_description: @house.web_description, website: @house.website }
    assert_redirected_to house_path(assigns(:house))
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete :destroy, id: @house
    end

    assert_redirected_to houses_path
  end
end
