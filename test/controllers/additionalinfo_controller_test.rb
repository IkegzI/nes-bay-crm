require 'test_helper'

class AdditionalinfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get additionalinfo_new_url
    assert_response :success
  end

  test "should get instrument" do
    get additionalinfo_instrument_url
    assert_response :success
  end

  test "should get service" do
    get additionalinfo_service_url
    assert_response :success
  end

  test "should get spherework" do
    get additionalinfo_spherework_url
    assert_response :success
  end

end
