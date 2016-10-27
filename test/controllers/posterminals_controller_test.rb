require 'test_helper'

class PosterminalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posterminals_index_url
    assert_response :success
  end

end
