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

require 'test_helper'

class ComparisonSetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
