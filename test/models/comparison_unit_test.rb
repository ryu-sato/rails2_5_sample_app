# == Schema Information
#
# Table name: comparison_units
#
#  id                :integer          not null, primary key
#  diff              :string           not null
#  lock_version      :integer          default(0)
#  name              :string           not null
#  comparison_set_id :integer
#  ticket_id         :integer
#
# Indexes
#
#  index_comparison_units_on_comparison_set_id  (comparison_set_id)
#  index_comparison_units_on_ticket_id          (ticket_id)
#

require 'test_helper'

class ComparisonUnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
