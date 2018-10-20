class Comparison < ApplicationRecord
  belongs_to :ticket
  belongs_to :normal_log,  class_name: 'CommandLog', foreign_key: 'normal_log_id'
  belongs_to :anomaly_log, class_name: 'CommandLog', foreign_key: 'anomaly_log_id'

  validates :ticket, presence: true
  validates :normal_log, presence: true
  validates :anomaly_log, presence: true
  validate :cannot_set_different_command

  def command_name
    normal_log.name
  end

  private
    def cannot_set_different_command
      if normal_log.name != anomaly_log.name
        errors.add(:normal_log_or_anomaly_log, "cannot set different command")
      end
    end
end
