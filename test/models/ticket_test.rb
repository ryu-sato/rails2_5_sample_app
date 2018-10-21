# == Schema Information
#
# Table name: tickets
#
#  id            :integer          not null, primary key
#  code          :string           not null
#  maker         :string           not null
#  hostname      :string           not null
#  processing_id :integer
#  lock_version  :integer          default(0)
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
