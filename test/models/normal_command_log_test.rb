# == Schema Information
#
# Table name: normal_command_logs
#
#  id                        :integer          not null, primary key
#  name                      :string           not null
#  normal_command_log_set_id :integer
#  comparison_unit_id        :integer
#  lock_version              :integer          default(0)
#

require 'test_helper'

class NormalCommandLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
