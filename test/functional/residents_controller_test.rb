require 'test_helper'

class ResidentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get myinfo" do
    get :myinfo
    assert_response :success
  end

  test "should get contactlist" do
    get :contactlist
    assert_response :success
  end

  test "should get programs" do
    get :programs
    assert_response :success
  end

  test "should get receipts" do
    current_user = users(:user1)
    get :receipts
    assert_response :success
  end

  test "should get budget" do
    get :budget
    assert_response :success
  end

end
