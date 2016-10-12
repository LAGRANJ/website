require 'test_helper'

class Products::DepositTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_deposit_types_index_url
    assert_response :success
  end

end
