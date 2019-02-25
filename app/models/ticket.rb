# == Schema Information
#
# Table name: tickets
#
#  id           :integer          not null, primary key
#  code         :string           not null
#  lock_version :integer          default(0)
#  host_id      :integer
#
# Indexes
#
#  index_tickets_on_host_id  (host_id)
#

class Ticket < ApplicationRecord
  before_save :upcase_code

  belongs_to :host, inverse_of: :tickets
  has_many :raw_logs, inverse_of: :ticket
  has_many :diff_sets, inverse_of: :ticket, dependent: :destroy

  VALID_TICKET_REGEX = /(ju|al|ci)-\d{4}-\d{3}/i
  validates :code, uniqueness: true, presence: true, format: { with: VALID_TICKET_REGEX }
  validates :host, presence: true
  validates :raw_logs, presence: true, length: { is: 2 }
  validates :diff_sets, length: { maximum: 2 }

  validate :cannot_has_more_than_two_diff_sets_which_has_same_phase
  validate :cannot_has_more_than_two_raw_logs_which_has_same_log_type

  def to_s
    code_s = "#{code.presence || 'no code'}"
    host_s = "#{host.presence || 'no host'}"
    "#{code_s} / #{host_s}"
  end

  def abnormal_log
    raw_logs.abnormal_log&.first
  end

  def normal_log
    raw_logs.normal_log&.first
  end

  private
    def upcase_code
      self.code = code.upcase
    end

    def cannot_has_more_than_two_diff_sets_which_has_same_phase
      if diff_sets.parsed_and_no_unused_values.size >= 2 || diff_sets.removed_flow_values.size >= 2
        errors.add(:diff_sets, "cannot has more than two diff sets which has same phase")
      end
    end

    def cannot_has_more_than_two_raw_logs_which_has_same_log_type
      if raw_logs.normal_log.size >= 2 || raw_logs.abnormal_log.size >= 2
        errors.add(:raw_logs, "cannot has more than two raw logs which has same log type")
      end
    end
end
