# == Schema Information
#
# Table name: anomaly_command_logs
#
#  id                         :integer          not null, primary key
#  lock_version               :integer          default(0)
#  name                       :string           not null
#  result                     :string           not null
#  anomaly_command_log_set_id :integer
#
# Indexes
#
#  index_anomaly_command_logs_on_anomaly_command_log_set_id  (anomaly_command_log_set_id)
#

class AnomalyCommandLog < ApplicationRecord
  belongs_to :anomaly_command_log_set, inverse_of: :anomaly_command_logs

  def low_priority?
    name =~ /^request support information/
  end
end
