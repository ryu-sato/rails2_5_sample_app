require "application_system_test_case"

class CommandLogsTest < ApplicationSystemTestCase
  setup do
    @command_log = command_logs(:one)
  end

  test "visiting the index" do
    visit command_logs_url
    assert_selector "h1", text: "Command Logs"
  end

  test "creating a Command log" do
    visit command_logs_url
    click_on "New Command Log"

    click_on "Create Command log"

    assert_text "Command log was successfully created"
    click_on "Back"
  end

  test "updating a Command log" do
    visit command_logs_url
    click_on "Edit", match: :first

    click_on "Update Command log"

    assert_text "Command log was successfully updated"
    click_on "Back"
  end

  test "destroying a Command log" do
    visit command_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Command log was successfully destroyed"
  end
end
