require "application_system_test_case"

class AnomalyLogRawsTest < ApplicationSystemTestCase
  setup do
    @anomaly_log_raw = anomaly_log_raws(:one)
  end

  test "visiting the index" do
    visit anomaly_log_raws_url
    assert_selector "h1", text: "Anomaly Log Raws"
  end

  test "creating a Anomaly log raw" do
    visit anomaly_log_raws_url
    click_on "New Anomaly Log Raw"

    click_on "Create Anomaly log raw"

    assert_text "Anomaly log raw was successfully created"
    click_on "Back"
  end

  test "updating a Anomaly log raw" do
    visit anomaly_log_raws_url
    click_on "Edit", match: :first

    click_on "Update Anomaly log raw"

    assert_text "Anomaly log raw was successfully updated"
    click_on "Back"
  end

  test "destroying a Anomaly log raw" do
    visit anomaly_log_raws_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Anomaly log raw was successfully destroyed"
  end
end
