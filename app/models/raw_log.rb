# == Schema Information
#
# Table name: raw_logs
#
#  id               :integer          not null, primary key
#  acquisition_date :date             not null
#  lock_version     :integer          default(0)
#  log_type         :string           not null
#  host_id          :integer
#  ticket_id        :integer
#
# Indexes
#
#  index_raw_logs_on_host_id    (host_id)
#  index_raw_logs_on_ticket_id  (ticket_id)
#

class RawLog < ApplicationRecord
  belongs_to :ticket, inverse_of: :raw_logs, optional: true
  belongs_to :host
  has_many :command_log_sets, inverse_of: :raw_log

  has_one_attached :raw_log

  VALID_LOG_TYPES = %w(normal abnormal)
  validates :log_type, inclusion: { in: VALID_LOG_TYPES }
  validates :host, presence: true
  validates :command_log_sets, presence: false, length: { maximum: 2 }
  validate :cannot_has_more_than_two_command_log_sets_which_has_same_phase

  scope :normal_log,   -> { where(log_type: :normal) }
  scope :abnormal_log, -> { where(log_type: :abnormal) }

  def to_s
    "#{log_type} log of #{host}"
  end

  private
    def cannot_has_more_than_two_command_log_sets_which_has_same_phase
      command_log_sets.parsed_and_no_unused_values.size >= 2 || command_log_sets.removed_flow_values.size >= 2
    end
end
