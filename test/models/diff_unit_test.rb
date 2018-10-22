# == Schema Information
#
# Table name: diff_units
#
#  id           :integer          not null, primary key
#  abnormal_log :string
#  diff         :string
#  name         :string
#  normal_log   :string
#  diff_set_id  :integer
#
# Indexes
#
#  index_diff_units_on_diff_set_id  (diff_set_id)
#

require 'test_helper'

class DiffUnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
