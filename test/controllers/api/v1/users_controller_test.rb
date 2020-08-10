require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get api_v1_users_users_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_users_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_users_create_url
    assert_response :success
  end

end
