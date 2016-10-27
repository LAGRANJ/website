require 'test_helper'

class Admin::DepositTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deposit_type = deposit_types(:one)
  end

  test "should get index" do
    get deposit_types_url
    assert_response :success
  end

  test "should get new" do
    get new_deposit_type_url
    assert_response :success
  end

  test "should create deposit_type" do
    assert_difference('DepositType.count') do
      post deposit_types_url, params: { deposit_type: {  } }
    end

    assert_redirected_to deposit_type_url(DepositType.last)
  end

  test "should show deposit_type" do
    get deposit_type_url(@deposit_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_deposit_type_url(@deposit_type)
    assert_response :success
  end

  test "should update deposit_type" do
    patch deposit_type_url(@deposit_type), params: { deposit_type: {  } }
    assert_redirected_to deposit_type_url(@deposit_type)
  end

  test "should destroy deposit_type" do
    assert_difference('DepositType.count', -1) do
      delete deposit_type_url(@deposit_type)
    end

    assert_redirected_to deposit_types_url
  end
end
