# == Schema Information
#
# Table name: command_log_sets
#
#  id           :integer          not null, primary key
#  lock_version :integer          default(0)
#  phase        :string           not null
#  raw_log_id   :integer
#
# Indexes
#
#  index_command_log_sets_on_raw_log_id  (raw_log_id)
#

require 'test_helper'

class CommandLogSetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
