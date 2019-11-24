require 'test_helper'

class JurfaceControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get jurface_new_url
    assert_response :success
  end

  test "should get create" do
    get jurface_create_url
    assert_response :success
  end

  test "should get edit" do
    get jurface_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get jurface_destroy_url
    assert_response :success
  end

end
