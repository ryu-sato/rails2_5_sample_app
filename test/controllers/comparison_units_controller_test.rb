require 'test_helper'

class ComparisonUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comparison_unit = comparison_units(:one)
  end

  test "should get index" do
    get comparison_units_url
    assert_response :success
  end

  test "should get new" do
    get new_comparison_unit_url
    assert_response :success
  end

  test "should create comparison_unit" do
    assert_difference('ComparisonUnit.count') do
      post comparison_units_url, params: { comparison_unit: {  } }
    end

    assert_redirected_to comparison_unit_url(ComparisonUnit.last)
  end

  test "should show comparison_unit" do
    get comparison_unit_url(@comparison_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_comparison_unit_url(@comparison_unit)
    assert_response :success
  end

  test "should update comparison_unit" do
    patch comparison_unit_url(@comparison_unit), params: { comparison_unit: {  } }
    assert_redirected_to comparison_unit_url(@comparison_unit)
  end

  test "should destroy comparison_unit" do
    assert_difference('ComparisonUnit.count', -1) do
      delete comparison_unit_url(@comparison_unit)
    end

    assert_redirected_to comparison_units_url
  end
end
