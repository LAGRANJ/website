require 'test_helper'

class Products::CreditTypes::CreditsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_credit_types_credits_index_url
    assert_response :success
  end

end
