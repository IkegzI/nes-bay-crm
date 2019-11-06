require 'test_helper'

class CompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get company_create_url
    assert_response :success
  end

  test "should get show" do
    get company_show_url
    assert_response :success
  end

  test "should get edit" do
    get company_edit_url
    assert_response :success
  end

  test "should get delete" do
    get company_delete_url
    assert_response :success
  end

  test "should get index" do
    get company_index_url
    assert_response :success
  end

end
