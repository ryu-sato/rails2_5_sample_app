# == Schema Information
#
# Table name: anomaly_command_log_sets
#
#  id                 :integer          not null, primary key
#  lock_version       :integer          default(0)
#  type               :string           not null
#  anomaly_log_raw_id :integer
#  comparison_set_id  :integer
#
# Indexes
#
#  index_anomaly_command_log_sets_on_anomaly_log_raw_id  (anomaly_log_raw_id)
#  index_anomaly_command_log_sets_on_comparison_set_id   (comparison_set_id)
#

class AnomalyCommandLogSet < ApplicationRecord
  belongs_to :anomaly_log_raw, inverse_of: :anomaly_command_log_sets
  belongs_to :comparison_set, inverse_of: :anomaly_command_log_set
  has_many :anomaly_command_logs, inverse_of: :anomaly_command_log_set
end
