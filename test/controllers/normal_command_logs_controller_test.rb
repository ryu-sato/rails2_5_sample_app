require 'test_helper'

class NormalCommandLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @normal_command_log = normal_command_logs(:one)
  end

  test "should get index" do
    get normal_command_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_normal_command_log_url
    assert_response :success
  end

  test "should create normal_command_log" do
    assert_difference('NormalCommandLog.count') do
      post normal_command_logs_url, params: { normal_command_log: {  } }
    end

    assert_redirected_to normal_command_log_url(NormalCommandLog.last)
  end

  test "should show normal_command_log" do
    get normal_command_log_url(@normal_command_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_normal_command_log_url(@normal_command_log)
    assert_response :success
  end

  test "should update normal_command_log" do
    patch normal_command_log_url(@normal_command_log), params: { normal_command_log: {  } }
    assert_redirected_to normal_command_log_url(@normal_command_log)
  end

  test "should destroy normal_command_log" do
    assert_difference('NormalCommandLog.count', -1) do
      delete normal_command_log_url(@normal_command_log)
    end

    assert_redirected_to normal_command_logs_url
  end
end
