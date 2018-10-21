class RawCommandLogSet < ApplicationRecord
  has_one :command_log_set
  belongs_to :ticket, inverse_of: :raw_command_log_set

  validates :hostname, presence: true, uniqueness: true
  validates :is_normal, presence: true, default: false
end
