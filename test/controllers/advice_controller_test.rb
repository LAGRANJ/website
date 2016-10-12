require 'test_helper'

class AdviceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get advice_index_url
    assert_response :success
  end

end
