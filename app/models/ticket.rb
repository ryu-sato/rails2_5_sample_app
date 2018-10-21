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

  has_one :command_log_set, as: :normal_command_log_set, inverse_of: :ticket
  has_one :raw_command_log_set, as: :anomaly_command_log_set, inverse_of: :ticket

  has_many :comparison_sets

  VALID_TICKET_REGEX = /(ju|al|ci)-\d{4}-\d{3}/i
  validates :code, uniqueness: true, presence: true, format: { with: VALID_TICKET_REGEX }
  validates :maker, presence: true
  validates :hostname, presence: true

  validates :comparison_sets, length: { maximum: 2 }

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
