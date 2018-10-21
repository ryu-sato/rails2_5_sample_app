require "application_system_test_case"

class ComparisonSetsTest < ApplicationSystemTestCase
  setup do
    @comparison_set = comparison_sets(:one)
  end

  test "visiting the index" do
    visit comparison_sets_url
    assert_selector "h1", text: "Comparison Sets"
  end

  test "creating a Comparison set" do
    visit comparison_sets_url
    click_on "New Comparison Set"

    click_on "Create Comparison set"

    assert_text "Comparison set was successfully created"
    click_on "Back"
  end

  test "updating a Comparison set" do
    visit comparison_sets_url
    click_on "Edit", match: :first

    click_on "Update Comparison set"

    assert_text "Comparison set was successfully updated"
    click_on "Back"
  end

  test "destroying a Comparison set" do
    visit comparison_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comparison set was successfully destroyed"
  end
end
