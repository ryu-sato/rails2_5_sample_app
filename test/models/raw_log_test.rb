# == Schema Information
#
# Table name: raw_logs
#
#  id               :integer          not null, primary key
#  acquisition_date :date             not null
#  lock_version     :integer          default(0)
#  log_type         :string           not null
#  host_id          :integer
#  ticket_id        :integer
#
# Indexes
#
#  index_raw_logs_on_host_id    (host_id)
#  index_raw_logs_on_ticket_id  (ticket_id)
#

require 'test_helper'

class RawLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
