require "application_system_test_case"

class NormalLogRawsTest < ApplicationSystemTestCase
  setup do
    @normal_log_raw = normal_log_raws(:one)
  end

  test "visiting the index" do
    visit normal_log_raws_url
    assert_selector "h1", text: "Normal Log Raws"
  end

  test "creating a Normal log raw" do
    visit normal_log_raws_url
    click_on "New Normal Log Raw"

    click_on "Create Normal log raw"

    assert_text "Normal log raw was successfully created"
    click_on "Back"
  end

  test "updating a Normal log raw" do
    visit normal_log_raws_url
    click_on "Edit", match: :first

    click_on "Update Normal log raw"

    assert_text "Normal log raw was successfully updated"
    click_on "Back"
  end

  test "destroying a Normal log raw" do
    visit normal_log_raws_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Normal log raw was successfully destroyed"
  end
end
