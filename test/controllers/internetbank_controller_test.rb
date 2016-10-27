require 'test_helper'

class InternetbankControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get internetbank_index_url
    assert_response :success
  end

end
