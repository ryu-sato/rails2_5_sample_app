# == Schema Information
#
# Table name: hosts
#
#  id           :integer          not null, primary key
#  lock_version :integer          default(0)
#  maker        :string           not null
#  name         :string           not null
#

require 'test_helper'

class HostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
