require 'test_helper'

class Admin::GarantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @garant = garants(:one)
  end

  test "should get index" do
    get garants_url
    assert_response :success
  end

  test "should get new" do
    get new_garant_url
    assert_response :success
  end

  test "should create garant" do
    assert_difference('Garant.count') do
      post garants_url, params: { garant: {  } }
    end

    assert_redirected_to garant_url(Garant.last)
  end

  test "should show garant" do
    get garant_url(@garant)
    assert_response :success
  end

  test "should get edit" do
    get edit_garant_url(@garant)
    assert_response :success
  end

  test "should update garant" do
    patch garant_url(@garant), params: { garant: {  } }
    assert_redirected_to garant_url(@garant)
  end

  test "should destroy garant" do
    assert_difference('Garant.count', -1) do
      delete garant_url(@garant)
    end

    assert_redirected_to garants_url
  end
end
