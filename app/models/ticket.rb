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
