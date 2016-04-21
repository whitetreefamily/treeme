require 'test_helper'

class UserSettingControllerTest < ActionController::TestCase
  test "should get image" do
    get :image
    assert_response :success
  end

  test "should get password" do
    get :password
    assert_response :success
  end

  test "should get tree" do
    get :tree
    assert_response :success
  end

  test "should get branching" do
    get :branching
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
