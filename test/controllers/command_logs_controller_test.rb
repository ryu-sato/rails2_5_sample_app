require 'test_helper'

class CommandLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @command_log = command_logs(:one)
  end

  test "should get index" do
    get command_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_command_log_url
    assert_response :success
  end

  test "should create command_log" do
    assert_difference('CommandLog.count') do
      post command_logs_url, params: { command_log: {  } }
    end

    assert_redirected_to command_log_url(CommandLog.last)
  end

  test "should show command_log" do
    get command_log_url(@command_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_command_log_url(@command_log)
    assert_response :success
  end

  test "should update command_log" do
    patch command_log_url(@command_log), params: { command_log: {  } }
    assert_redirected_to command_log_url(@command_log)
  end

  test "should destroy command_log" do
    assert_difference('CommandLog.count', -1) do
      delete command_log_url(@command_log)
    end

    assert_redirected_to command_logs_url
  end
end
