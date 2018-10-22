# == Schema Information
#
# Table name: command_logs
#
#  id                 :integer          not null, primary key
#  lock_version       :integer          default(0)
#  name               :string           not null
#  result             :string           not null
#  command_log_set_id :integer
#
# Indexes
#
#  index_command_logs_on_command_log_set_id  (command_log_set_id)
#

require 'test_helper'

class CommandLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
