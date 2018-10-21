# == Schema Information
#
# Table name: normal_command_log_sets
#
#  id                :integer          not null, primary key
#  lock_version      :integer          default(0)
#  type              :string           not null
#  comparison_set_id :integer
#  normal_log_raw_id :integer
#
# Indexes
#
#  index_normal_command_log_sets_on_comparison_set_id  (comparison_set_id)
#  index_normal_command_log_sets_on_normal_log_raw_id  (normal_log_raw_id)
#

require 'test_helper'

class NormalCommandLogSetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
