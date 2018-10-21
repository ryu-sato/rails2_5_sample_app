json.extract! anomaly_log_raw, :id, :created_at, :updated_at
json.url anomaly_log_raw_url(anomaly_log_raw, format: :json)
