require "application_system_test_case"

class ComparisonUnitsTest < ApplicationSystemTestCase
  setup do
    @comparison_unit = comparison_units(:one)
  end

  test "visiting the index" do
    visit comparison_units_url
    assert_selector "h1", text: "Comparison Units"
  end

  test "creating a Comparison unit" do
    visit comparison_units_url
    click_on "New Comparison Unit"

    click_on "Create Comparison unit"

    assert_text "Comparison unit was successfully created"
    click_on "Back"
  end

  test "updating a Comparison unit" do
    visit comparison_units_url
    click_on "Edit", match: :first

    click_on "Update Comparison unit"

    assert_text "Comparison unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Comparison unit" do
    visit comparison_units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comparison unit was successfully destroyed"
  end
end
