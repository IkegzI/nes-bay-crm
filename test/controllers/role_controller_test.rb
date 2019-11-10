require 'test_helper'

class RoleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get role_new_url
    assert_response :success
  end

  test "should get index" do
    get role_index_url
    assert_response :success
  end

  test "should get destroy" do
    get role_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get role_edit_url
    assert_response :success
  end

end
