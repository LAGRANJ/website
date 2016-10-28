require 'test_helper'

class MiniSpecialOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mini_special_offers_index_url
    assert_response :success
  end

  test "should get show" do
    get mini_special_offers_show_url
    assert_response :success
  end

end
