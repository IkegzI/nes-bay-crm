require 'test_helper'

class TalkControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get talk_new_url
    assert_response :success
  end

end
