# == Schema Information
#
# Table name: comparison_sets
#
#  id                         :integer          not null, primary key
#  diff_summary               :string           not null
#  normal_command_log_set_id  :integer
#  anomaly_command_log_set_id :integer
#  lock_version               :integer          default(0)
#

class ComparisonSet < ApplicationRecord
  has_one :normal_command_log_set, inverse_of: :comparison_set
  has_one :anomaly_command_log_set, inverse_of: :comparison_set
end
