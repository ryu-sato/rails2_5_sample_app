# == Schema Information
#
# Table name: normal_command_log_sets
#
#  id                :integer          not null, primary key
#  lock_version      :integer          default(0)
#  phase             :string           not null
#  normal_log_raw_id :integer
#
# Indexes
#
#  index_normal_command_log_sets_on_normal_log_raw_id  (normal_log_raw_id)
#

class NormalCommandLogSet < ApplicationRecord
  belongs_to :normal_log_raw, inverse_of: :normal_command_log_sets
  has_many :normal_command_logs, inverse_of: :normal_command_log_set

  COMMAND_SET_PHASES = %w(parsed_and_no_unused_values removed_flow_values)
  validates :phase, inclusion: { in: COMMAND_SET_PHASES }
end
