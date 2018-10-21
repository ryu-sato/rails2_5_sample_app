require "application_system_test_case"

class NormalCommandLogsTest < ApplicationSystemTestCase
  setup do
    @normal_command_log = normal_command_logs(:one)
  end

  test "visiting the index" do
    visit normal_command_logs_url
    assert_selector "h1", text: "Normal Command Logs"
  end

  test "creating a Normal command log" do
    visit normal_command_logs_url
    click_on "New Normal Command Log"

    click_on "Create Normal command log"

    assert_text "Normal command log was successfully created"
    click_on "Back"
  end

  test "updating a Normal command log" do
    visit normal_command_logs_url
    click_on "Edit", match: :first

    click_on "Update Normal command log"

    assert_text "Normal command log was successfully updated"
    click_on "Back"
  end

  test "destroying a Normal command log" do
    visit normal_command_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Normal command log was successfully destroyed"
  end
end
