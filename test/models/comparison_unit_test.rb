# == Schema Information
#
# Table name: comparison_units
#
#  id                     :integer          not null, primary key
#  diff_summary           :string           not null
#  normal_command_log_id  :integer
#  anomaly_command_log_id :integer
#  lock_version           :integer          default(0)
#

require 'test_helper'

class ComparisonUnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
