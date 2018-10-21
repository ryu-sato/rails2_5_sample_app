require 'test_helper'

class AnomalyLogRawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anomaly_log_raw = anomaly_log_raws(:one)
  end

  test "should get index" do
    get anomaly_log_raws_url
    assert_response :success
  end

  test "should get new" do
    get new_anomaly_log_raw_url
    assert_response :success
  end

  test "should create anomaly_log_raw" do
    assert_difference('AnomalyLogRaw.count') do
      post anomaly_log_raws_url, params: { anomaly_log_raw: {  } }
    end

    assert_redirected_to anomaly_log_raw_url(AnomalyLogRaw.last)
  end

  test "should show anomaly_log_raw" do
    get anomaly_log_raw_url(@anomaly_log_raw)
    assert_response :success
  end

  test "should get edit" do
    get edit_anomaly_log_raw_url(@anomaly_log_raw)
    assert_response :success
  end

  test "should update anomaly_log_raw" do
    patch anomaly_log_raw_url(@anomaly_log_raw), params: { anomaly_log_raw: {  } }
    assert_redirected_to anomaly_log_raw_url(@anomaly_log_raw)
  end

  test "should destroy anomaly_log_raw" do
    assert_difference('AnomalyLogRaw.count', -1) do
      delete anomaly_log_raw_url(@anomaly_log_raw)
    end

    assert_redirected_to anomaly_log_raws_url
  end
end
