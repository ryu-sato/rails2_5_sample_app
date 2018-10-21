# == Schema Information
#
# Table name: anomaly_command_log_sets
#
#  id                 :integer          not null, primary key
#  lock_version       :integer          default(0)
#  phase              :string           not null
#  anomaly_log_raw_id :integer
#
# Indexes
#
#  index_anomaly_command_log_sets_on_anomaly_log_raw_id  (anomaly_log_raw_id)
#

require 'test_helper'

class AnomalyCommandLogSetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
