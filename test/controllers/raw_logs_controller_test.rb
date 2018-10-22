require 'test_helper'

class RawLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raw_log = raw_logs(:one)
  end

  test "should get index" do
    get raw_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_raw_log_url
    assert_response :success
  end

  test "should create raw_log" do
    assert_difference('RawLog.count') do
      post raw_logs_url, params: { raw_log: {  } }
    end

    assert_redirected_to raw_log_url(RawLog.last)
  end

  test "should show raw_log" do
    get raw_log_url(@raw_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_raw_log_url(@raw_log)
    assert_response :success
  end

  test "should update raw_log" do
    patch raw_log_url(@raw_log), params: { raw_log: {  } }
    assert_redirected_to raw_log_url(@raw_log)
  end

  test "should destroy raw_log" do
    assert_difference('RawLog.count', -1) do
      delete raw_log_url(@raw_log)
    end

    assert_redirected_to raw_logs_url
  end
end
