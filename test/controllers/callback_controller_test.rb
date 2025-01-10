require "test_helper"

class CallbackControllerTest < ActionDispatch::IntegrationTest
  test "should get line" do
    get callback_line_url
    assert_response :success
  end

  test "should get telegram" do
    get callback_telegram_url
    assert_response :success
  end
end
