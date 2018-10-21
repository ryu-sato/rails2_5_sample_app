# == Schema Information
#
# Table name: anomaly_log_raws
#
#  id           :integer          not null, primary key
#  hostname     :string           not null
#  lock_version :integer          default(0)
#

class AnomalyLogRaw < ApplicationRecord
  has_many :tickets, inverse_of: :anomaly_log_raw
  has_many :anomaly_command_log_sets, inverse_of: :anomaly_log_raw

  has_one_attached :raw_log

  validates :anomaly_command_log_sets, length: { maximum: 2 }
end
