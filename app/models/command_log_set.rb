# == Schema Information
#
# Table name: command_log_sets
#
#  id           :integer          not null, primary key
#  lock_version :integer          default(0)
#  phase        :string           not null
#  raw_log_id   :integer
#
# Indexes
#
#  index_command_log_sets_on_raw_log_id  (raw_log_id)
#

class CommandLogSet < ApplicationRecord
  include HasProcessingPhase

  belongs_to :raw_log, inverse_of: :command_log_sets, optional: true
  has_many :command_logs, inverse_of: :command_log_set, dependent: :destroy
end
