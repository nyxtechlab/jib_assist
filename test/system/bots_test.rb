require "application_system_test_case"

class BotsTest < ApplicationSystemTestCase
  setup do
    @bot = bots(:one)
  end

  test "visiting the index" do
    visit bots_url
    assert_selector "h1", text: "Bots"
  end

  test "should create bot" do
    visit bots_url
    click_on "New bot"

    fill_in "Config store", with: @bot.config_store
    fill_in "Name", with: @bot.name
    fill_in "Platform", with: @bot.platform
    click_on "Create Bot"

    assert_text "Bot was successfully created"
    click_on "Back"
  end

  test "should update Bot" do
    visit bot_url(@bot)
    click_on "Edit this bot", match: :first

    fill_in "Config store", with: @bot.config_store
    fill_in "Name", with: @bot.name
    fill_in "Platform", with: @bot.platform
    click_on "Update Bot"

    assert_text "Bot was successfully updated"
    click_on "Back"
  end

  test "should destroy Bot" do
    visit bot_url(@bot)
    click_on "Destroy this bot", match: :first

    assert_text "Bot was successfully destroyed"
  end
end
