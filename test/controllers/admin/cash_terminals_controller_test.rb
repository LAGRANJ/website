require 'test_helper'

class Admin::CashTerminalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_terminal = cash_terminals(:one)
  end

  test "should get index" do
    get cash_terminals_url
    assert_response :success
  end

  test "should get new" do
    get new_cash_terminal_url
    assert_response :success
  end

  test "should create cash_terminal" do
    assert_difference('CashTerminal.count') do
      post cash_terminals_url, params: { cash_terminal: {  } }
    end

    assert_redirected_to cash_terminal_url(CashTerminal.last)
  end

  test "should show cash_terminal" do
    get cash_terminal_url(@cash_terminal)
    assert_response :success
  end

  test "should get edit" do
    get edit_cash_terminal_url(@cash_terminal)
    assert_response :success
  end

  test "should update cash_terminal" do
    patch cash_terminal_url(@cash_terminal), params: { cash_terminal: {  } }
    assert_redirected_to cash_terminal_url(@cash_terminal)
  end

  test "should destroy cash_terminal" do
    assert_difference('CashTerminal.count', -1) do
      delete cash_terminal_url(@cash_terminal)
    end

    assert_redirected_to cash_terminals_url
  end
end
