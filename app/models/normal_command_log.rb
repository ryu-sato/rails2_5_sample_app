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

class NormalCommandLog < ApplicationRecord
  belongs_to :normal_command_log_set, inverse_of: :normal_command_logs
  belongs_to :comparison_unit, inverse_of: :normal_command_log
end
