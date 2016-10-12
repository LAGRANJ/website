require 'test_helper'

class OfficeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get office_index_url
    assert_response :success
  end

  test "should get show" do
    get office_show_url
    assert_response :success
  end

end
