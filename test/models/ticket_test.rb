# == Schema Information
#
# Table name: tickets
#
#  id                 :integer          not null, primary key
#  code               :string           not null
#  hostname           :string           not null
#  lock_version       :integer          default(0)
#  maker              :string           not null
#  anomaly_log_raw_id :integer
#  normal_log_raw_id  :integer
#
# Indexes
#
#  index_tickets_on_anomaly_log_raw_id  (anomaly_log_raw_id)
#  index_tickets_on_normal_log_raw_id   (normal_log_raw_id)
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
