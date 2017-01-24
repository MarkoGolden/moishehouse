require 'test_helper'

class GrantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grant
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
    # TODO - Figure out what really needs updating and
    # What the real sucess criteria is
    # get :update
    # assert_response :success
  end

end
