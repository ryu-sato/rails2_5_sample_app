# == Schema Information
#
# Table name: anomaly_command_logs
#
#  id                         :integer          not null, primary key
#  lock_version               :integer          default(0)
#  name                       :string           not null
#  result                     :string           not null
#  anomaly_command_log_set_id :integer
#
# Indexes
#
#  index_anomaly_command_logs_on_anomaly_command_log_set_id  (anomaly_command_log_set_id)
#

require 'test_helper'

class AnomalyCommandLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
