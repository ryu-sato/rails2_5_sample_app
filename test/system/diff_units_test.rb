require "application_system_test_case"

class DiffUnitsTest < ApplicationSystemTestCase
  setup do
    @diff_unit = diff_units(:one)
  end

  test "visiting the index" do
    visit diff_units_url
    assert_selector "h1", text: "Diff Units"
  end

  test "creating a Diff unit" do
    visit diff_units_url
    click_on "New Diff Unit"

    click_on "Create Diff unit"

    assert_text "Diff unit was successfully created"
    click_on "Back"
  end

  test "updating a Diff unit" do
    visit diff_units_url
    click_on "Edit", match: :first

    click_on "Update Diff unit"

    assert_text "Diff unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Diff unit" do
    visit diff_units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diff unit was successfully destroyed"
  end
end
