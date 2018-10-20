class Comparison < ApplicationRecord
  belongs_to :ticket
  belongs_to :normal_log_set,  class_name: 'CommandLogSet', foreign_key: 'normal_log_set_id'
  belongs_to :anomaly_log_set, class_name: 'CommandLogSet', foreign_key: 'anomaly_log_set_id'

  validates :ticket, presence: true
  validates :normal_log_set, presence: true
  validates :anomaly_log_set, presence: true
end
