require 'test_helper'

class NormalLogRawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @normal_log_raw = normal_log_raws(:one)
  end

  test "should get index" do
    get normal_log_raws_url
    assert_response :success
  end

  test "should get new" do
    get new_normal_log_raw_url
    assert_response :success
  end

  test "should create normal_log_raw" do
    assert_difference('NormalLogRaw.count') do
      post normal_log_raws_url, params: { normal_log_raw: {  } }
    end

    assert_redirected_to normal_log_raw_url(NormalLogRaw.last)
  end

  test "should show normal_log_raw" do
    get normal_log_raw_url(@normal_log_raw)
    assert_response :success
  end

  test "should get edit" do
    get edit_normal_log_raw_url(@normal_log_raw)
    assert_response :success
  end

  test "should update normal_log_raw" do
    patch normal_log_raw_url(@normal_log_raw), params: { normal_log_raw: {  } }
    assert_redirected_to normal_log_raw_url(@normal_log_raw)
  end

  test "should destroy normal_log_raw" do
    assert_difference('NormalLogRaw.count', -1) do
      delete normal_log_raw_url(@normal_log_raw)
    end

    assert_redirected_to normal_log_raws_url
  end
end
