class CommandLogSet < ApplicationRecord
  has_many :command_logs, inverse_of: :command_log_sets

  belongs_to :ticket
  has_one_attached :raw_log

  validates :name, presence: true
  validates :hostname, presence: true
  validates :is_normal, presence: true, default: false
end
