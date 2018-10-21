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

class NormalCommandLog < ApplicationRecord
  belongs_to :normal_command_log_set, inverse_of: :normal_command_logs
  belongs_to :comparison_unit, inverse_of: :normal_command_log
end
