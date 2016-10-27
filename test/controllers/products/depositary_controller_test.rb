require 'test_helper'

class Products::DepositaryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_depositary_index_url
    assert_response :success
  end

end
