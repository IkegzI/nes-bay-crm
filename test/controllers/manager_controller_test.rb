require 'test_helper'

class ManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get manager_new_url
    assert_response :success
  end

  test "should get create" do
    get manager_create_url
    assert_response :success
  end

  test "should get show" do
    get manager_show_url
    assert_response :success
  end

  test "should get edit" do
    get manager_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get manager_destroy_url
    assert_response :success
  end

end
