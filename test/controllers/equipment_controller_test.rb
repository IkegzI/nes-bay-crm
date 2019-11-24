require 'test_helper'

class EquipmentControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get equipment_new_url
    assert_response :success
  end

  test "should get create" do
    get equipment_create_url
    assert_response :success
  end

  test "should get edit" do
    get equipment_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get equipment_destroy_url
    assert_response :success
  end

end
