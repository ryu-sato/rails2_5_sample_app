# == Schema Information
#
# Table name: comparison_units
#
#  id                     :integer          not null, primary key
#  diff_summary           :string           not null
#  lock_version           :integer          default(0)
#  anomaly_command_log_id :integer
#  normal_command_log_id  :integer
#
# Indexes
#
#  index_comparison_units_on_anomaly_command_log_id  (anomaly_command_log_id)
#  index_comparison_units_on_normal_command_log_id   (normal_command_log_id)
#

class ComparisonUnit < ApplicationRecord
  has_one :normal_command_log, inverse_of: :comparison_unit
  has_one :anomaly_command_log, inverse_of: :comparison_unit
end
