require 'test_helper'

class WebSupportControllerTest < ActionDispatch::IntegrationTest
  test "should get send_message" do
    get web_support_send_message_url
    assert_response :success
  end

end
