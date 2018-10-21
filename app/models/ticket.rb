# == Schema Information
#
# Table name: tickets
#
#  id                 :integer          not null, primary key
#  code               :string           not null
#  hostname           :string           not null
#  lock_version       :integer          default(0)
#  maker              :string           not null
#  anomaly_log_raw_id :integer
#  normal_log_raw_id  :integer
#
# Indexes
#
#  index_tickets_on_anomaly_log_raw_id  (anomaly_log_raw_id)
#  index_tickets_on_normal_log_raw_id   (normal_log_raw_id)
#

class Ticket < ApplicationRecord
  before_save :upcase_code
  before_save :downcase_maker

  belongs_to :normal_log_raw, inverse_of: :tickets, required: true
  belongs_to :anomaly_log_raw, inverse_of: :tickets, required: true

  VALID_TICKET_REGEX = /(ju|al|ci)-\d{4}-\d{3}/i
  validates :code, uniqueness: true, presence: true, format: { with: VALID_TICKET_REGEX }
  validates :maker, presence: true
  validates :hostname, presence: true

  def to_s
    code.presence || 'no code'
  end

  private
    def upcase_code
      self.code = code.upcase
    end

    def downcase_maker
      self.maker = maker.downcase
    end
end
