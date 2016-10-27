require 'test_helper'

class SpecialOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get special_offers_index_url
    assert_response :success
  end

  test "should get show" do
    get special_offers_show_url
    assert_response :success
  end

end
