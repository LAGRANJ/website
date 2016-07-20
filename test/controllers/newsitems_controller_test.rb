require 'test_helper'

class NewsitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsitem = newsitems(:one)
  end

  test "should get index" do
    get newsitems_url
    assert_response :success
  end

  test "should get new" do
    get new_newsitem_url
    assert_response :success
  end

  test "should create newsitem" do
    assert_difference('Newsitem.count') do
      post newsitems_url, params: { newsitem: { body: @newsitem.body, caption: @newsitem.caption, creation_date: @newsitem.creation_date, priority: @newsitem.priority } }
    end

    assert_redirected_to newsitem_url(Newsitem.last)
  end

  test "should show newsitem" do
    get newsitem_url(@newsitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_newsitem_url(@newsitem)
    assert_response :success
  end

  test "should update newsitem" do
    patch newsitem_url(@newsitem), params: { newsitem: { body: @newsitem.body, caption: @newsitem.caption, creation_date: @newsitem.creation_date, priority: @newsitem.priority } }
    assert_redirected_to newsitem_url(@newsitem)
  end

  test "should destroy newsitem" do
    assert_difference('Newsitem.count', -1) do
      delete newsitem_url(@newsitem)
    end

    assert_redirected_to newsitems_url
  end
end
