require "application_system_test_case"

class AnomalyCommandLogsTest < ApplicationSystemTestCase
  setup do
    @anomaly_command_log = anomaly_command_logs(:one)
  end

  test "visiting the index" do
    visit anomaly_command_logs_url
    assert_selector "h1", text: "Anomaly Command Logs"
  end

  test "creating a Anomaly command log" do
    visit anomaly_command_logs_url
    click_on "New Anomaly Command Log"

    click_on "Create Anomaly command log"

    assert_text "Anomaly command log was successfully created"
    click_on "Back"
  end

  test "updating a Anomaly command log" do
    visit anomaly_command_logs_url
    click_on "Edit", match: :first

    click_on "Update Anomaly command log"

    assert_text "Anomaly command log was successfully updated"
    click_on "Back"
  end

  test "destroying a Anomaly command log" do
    visit anomaly_command_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Anomaly command log was successfully destroyed"
  end
end
