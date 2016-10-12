require 'test_helper'

class Products::TransferTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_transfer_types_index_url
    assert_response :success
  end

end
