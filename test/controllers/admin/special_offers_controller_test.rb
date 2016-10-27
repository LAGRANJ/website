require 'test_helper'

class Admin::SpecialOffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_offer = special_offers(:one)
  end

  test "should get index" do
    get special_offers_url
    assert_response :success
  end

  test "should get new" do
    get new_special_offer_url
    assert_response :success
  end

  test "should create special_offer" do
    assert_difference('SpecialOffer.count') do
      post special_offers_url, params: { special_offer: {  } }
    end

    assert_redirected_to special_offer_url(SpecialOffer.last)
  end

  test "should show special_offer" do
    get special_offer_url(@special_offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_offer_url(@special_offer)
    assert_response :success
  end

  test "should update special_offer" do
    patch special_offer_url(@special_offer), params: { special_offer: {  } }
    assert_redirected_to special_offer_url(@special_offer)
  end

  test "should destroy special_offer" do
    assert_difference('SpecialOffer.count', -1) do
      delete special_offer_url(@special_offer)
    end

    assert_redirected_to special_offers_url
  end
end
