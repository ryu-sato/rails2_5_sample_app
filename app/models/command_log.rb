class CommandLog < ApplicationRecord
  belongs_to :command_log_set, inverse_of: :command_logs

  validates :name, presence: true
end
