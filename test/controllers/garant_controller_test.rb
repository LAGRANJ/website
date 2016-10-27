require 'test_helper'

class GarantControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get garant_index_url
    assert_response :success
  end

end
