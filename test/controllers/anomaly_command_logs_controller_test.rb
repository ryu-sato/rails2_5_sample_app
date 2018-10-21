require 'test_helper'

class AnomalyCommandLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anomaly_command_log = anomaly_command_logs(:one)
  end

  test "should get index" do
    get anomaly_command_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_anomaly_command_log_url
    assert_response :success
  end

  test "should create anomaly_command_log" do
    assert_difference('AnomalyCommandLog.count') do
      post anomaly_command_logs_url, params: { anomaly_command_log: {  } }
    end

    assert_redirected_to anomaly_command_log_url(AnomalyCommandLog.last)
  end

  test "should show anomaly_command_log" do
    get anomaly_command_log_url(@anomaly_command_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_anomaly_command_log_url(@anomaly_command_log)
    assert_response :success
  end

  test "should update anomaly_command_log" do
    patch anomaly_command_log_url(@anomaly_command_log), params: { anomaly_command_log: {  } }
    assert_redirected_to anomaly_command_log_url(@anomaly_command_log)
  end

  test "should destroy anomaly_command_log" do
    assert_difference('AnomalyCommandLog.count', -1) do
      delete anomaly_command_log_url(@anomaly_command_log)
    end

    assert_redirected_to anomaly_command_logs_url
  end
end
