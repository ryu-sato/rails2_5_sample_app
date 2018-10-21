# == Schema Information
#
# Table name: normal_command_logs
#
#  id                        :integer          not null, primary key
#  lock_version              :integer          default(0)
#  name                      :string           not null
#  comparison_unit_id        :integer
#  normal_command_log_set_id :integer
#
# Indexes
#
#  index_normal_command_logs_on_comparison_unit_id         (comparison_unit_id)
#  index_normal_command_logs_on_normal_command_log_set_id  (normal_command_log_set_id)
#

require 'test_helper'

class NormalCommandLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
