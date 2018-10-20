class Ticket < ApplicationRecord
  before_save :upcase_code

  has_many :command_log_sets, inverse_of: :ticket

  VALID_TICKET_REGEX = /(ju|al|ci)-\d{4}-\d{3}/i
  validates :code, presence: true, format: { with: VALID_TICKET_REGEX }
  validates :maker, presence: true
  validates :hostname, presence: true

  validate :command_log_sets_cannot_include_more_than_two_normal_log_set

  def to_s
    code.presence || 'no code'
  end

  private
    def upcase_code
      self.code = code.upcase
    end

    def command_log_sets_cannot_include_more_than_two_normal_log_set
      if command_log_sets.where(is_normal: true).count >= 2
        errors.add(:command_log_sets, ': cannot include more than two normal log set')
      end
    end
end
