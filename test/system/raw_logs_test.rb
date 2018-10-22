require "application_system_test_case"

class RawLogsTest < ApplicationSystemTestCase
  setup do
    @raw_log = raw_logs(:one)
  end

  test "visiting the index" do
    visit raw_logs_url
    assert_selector "h1", text: "Raw Logs"
  end

  test "creating a Raw log" do
    visit raw_logs_url
    click_on "New Raw Log"

    click_on "Create Raw log"

    assert_text "Raw log was successfully created"
    click_on "Back"
  end

  test "updating a Raw log" do
    visit raw_logs_url
    click_on "Edit", match: :first

    click_on "Update Raw log"

    assert_text "Raw log was successfully updated"
    click_on "Back"
  end

  test "destroying a Raw log" do
    visit raw_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Raw log was successfully destroyed"
  end
end
