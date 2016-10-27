require 'test_helper'

class CorraccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get corraccounts_index_url
    assert_response :success
  end

end
