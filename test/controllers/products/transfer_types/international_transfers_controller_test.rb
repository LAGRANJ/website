require 'test_helper'

class Products::TransferTypes::InternationalTransfersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_transfer_types_international_transfers_index_url
    assert_response :success
  end

  test "should get show" do
    get products_transfer_types_international_transfers_show_url
    assert_response :success
  end

end
