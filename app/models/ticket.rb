class Ticket < ApplicationRecord
  before_save :upcase_code

  has_one :raw_normal_log, class_name: 'RawCommandLogSet', inverse_of: :ticket
  has_one_attached :raw_anomaly_log

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
end
