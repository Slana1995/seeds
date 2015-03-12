require 'test_helper'

class TaskControllerTest < ActionController::TestCase
  test "should get indexrails" do
    get :indexrails
    assert_response :success
  end

  test "should get g" do
    get :g
    assert_response :success
  end

  test "should get model" do
    get :model
    assert_response :success
  end

  test "should get User" do
    get :User
    assert_response :success
  end

  test "should get username:string" do
    get :username:string
    assert_response :success
  end

end
