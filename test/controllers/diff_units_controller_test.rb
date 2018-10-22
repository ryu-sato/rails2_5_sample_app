require 'test_helper'

class DiffUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diff_unit = diff_units(:one)
  end

  test "should get index" do
    get diff_units_url
    assert_response :success
  end

  test "should get new" do
    get new_diff_unit_url
    assert_response :success
  end

  test "should create diff_unit" do
    assert_difference('DiffUnit.count') do
      post diff_units_url, params: { diff_unit: {  } }
    end

    assert_redirected_to diff_unit_url(DiffUnit.last)
  end

  test "should show diff_unit" do
    get diff_unit_url(@diff_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_diff_unit_url(@diff_unit)
    assert_response :success
  end

  test "should update diff_unit" do
    patch diff_unit_url(@diff_unit), params: { diff_unit: {  } }
    assert_redirected_to diff_unit_url(@diff_unit)
  end

  test "should destroy diff_unit" do
    assert_difference('DiffUnit.count', -1) do
      delete diff_unit_url(@diff_unit)
    end

    assert_redirected_to diff_units_url
  end
end
