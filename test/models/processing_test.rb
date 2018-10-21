# == Schema Information
#
# Table name: processings
#
#  id                 :integer          not null, primary key
#  normal_log_raw_id  :integer
#  anomaly_log_raw_id :integer
#  lock_version       :integer          default(0)
#

require 'test_helper'

class ProcessingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
