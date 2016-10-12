require 'test_helper'

class Products::TransferTypes::LocalTransfersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_transfer_types_local_transfers_index_url
    assert_response :success
  end

  test "should get show" do
    get products_transfer_types_local_transfers_show_url
    assert_response :success
  end

end
