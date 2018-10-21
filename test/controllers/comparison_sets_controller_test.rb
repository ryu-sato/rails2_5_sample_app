require 'test_helper'

class ComparisonSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comparison_set = comparison_sets(:one)
  end

  test "should get index" do
    get comparison_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_comparison_set_url
    assert_response :success
  end

  test "should create comparison_set" do
    assert_difference('ComparisonSet.count') do
      post comparison_sets_url, params: { comparison_set: {  } }
    end

    assert_redirected_to comparison_set_url(ComparisonSet.last)
  end

  test "should show comparison_set" do
    get comparison_set_url(@comparison_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_comparison_set_url(@comparison_set)
    assert_response :success
  end

  test "should update comparison_set" do
    patch comparison_set_url(@comparison_set), params: { comparison_set: {  } }
    assert_redirected_to comparison_set_url(@comparison_set)
  end

  test "should destroy comparison_set" do
    assert_difference('ComparisonSet.count', -1) do
      delete comparison_set_url(@comparison_set)
    end

    assert_redirected_to comparison_sets_url
  end
end
