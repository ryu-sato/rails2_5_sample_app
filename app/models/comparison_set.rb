# == Schema Information
#
# Table name: comparison_sets
#
#  id                         :integer          not null, primary key
#  diff_summary               :string           not null
#  lock_version               :integer          default(0)
#  anomaly_command_log_set_id :integer
#  normal_command_log_set_id  :integer
#
# Indexes
#
#  index_comparison_sets_on_anomaly_command_log_set_id  (anomaly_command_log_set_id)
#  index_comparison_sets_on_normal_command_log_set_id   (normal_command_log_set_id)
#

class ComparisonSet < ApplicationRecord
  has_one :normal_command_log_set, inverse_of: :comparison_set
  has_one :anomaly_command_log_set, inverse_of: :comparison_set

  def phase
    "#{normal_command_log_set.phase} / #{anomaly_command_log_set.phase}"
  end
end
