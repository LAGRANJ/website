require 'test_helper'

class BankdetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bankdetails_index_url
    assert_response :success
  end

end
