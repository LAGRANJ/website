require 'test_helper'

class Products::CreditTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_credit_types_index_url
    assert_response :success
  end

end
