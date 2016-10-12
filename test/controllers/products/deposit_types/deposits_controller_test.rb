require 'test_helper'

class Products::DepositTypes::DepositsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_deposit_types_deposits_index_url
    assert_response :success
  end

  test "should get show" do
    get products_deposit_types_deposits_show_url
    assert_response :success
  end

end
