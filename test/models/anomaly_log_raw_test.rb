# == Schema Information
#
# Table name: anomaly_log_raws
#
#  id           :integer          not null, primary key
#  hostname     :string           not null
#  lock_version :integer          default(0)
#

require 'test_helper'

class AnomalyLogRawTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
