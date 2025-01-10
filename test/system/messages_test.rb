require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  setup do
    @message = messages(:one)
  end

  test "visiting the index" do
    visit messages_url
    assert_selector "h1", text: "Messages"
  end

  test "should create message" do
    visit messages_url
    click_on "New message"

    fill_in "Channel", with: @message.channel_id
    fill_in "Content", with: @message.content
    fill_in "Message type", with: @message.message_type
    fill_in "Raw data store", with: @message.raw_data_store
    fill_in "Sent at", with: @message.sent_at
    fill_in "User", with: @message.user_id
    click_on "Create Message"

    assert_text "Message was successfully created"
    click_on "Back"
  end

  test "should update Message" do
    visit message_url(@message)
    click_on "Edit this message", match: :first

    fill_in "Channel", with: @message.channel_id
    fill_in "Content", with: @message.content
    fill_in "Message type", with: @message.message_type
    fill_in "Raw data store", with: @message.raw_data_store
    fill_in "Sent at", with: @message.sent_at
    fill_in "User", with: @message.user_id
    click_on "Update Message"

    assert_text "Message was successfully updated"
    click_on "Back"
  end

  test "should destroy Message" do
    visit message_url(@message)
    click_on "Destroy this message", match: :first

    assert_text "Message was successfully destroyed"
  end
end
