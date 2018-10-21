# == Schema Information
#
# Table name: comparison_sets
#
#  id           :integer          not null, primary key
#  diff_summary :string           not null
#  lock_version :integer          default(0)
#  phase        :string           not null
#  ticket_id    :integer
#
# Indexes
#
#  index_comparison_sets_on_ticket_id  (ticket_id)
#

require 'test_helper'

class ComparisonSetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
