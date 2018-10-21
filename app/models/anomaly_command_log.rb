# == Schema Information
#
# Table name: anomaly_command_logs
#
#  id                         :integer          not null, primary key
#  name                       :string           not null
#  anomaly_command_log_set_id :integer
#  comparison_unit_id         :integer
#  lock_version               :integer          default(0)
#

class AnomalyCommandLog < ApplicationRecord
  belongs_to :anomaly_command_log_set, inverse_of: :anomaly_command_logs
  belongs_to :comparison_unit, inverse_of: :anomaly_command_log
end
