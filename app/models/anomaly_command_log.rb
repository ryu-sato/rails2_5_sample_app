# == Schema Information
#
# Table name: anomaly_command_logs
#
#  id                         :integer          not null, primary key
#  name                       :string           not null
#  anomaly_command_log_set_id :integer
#  comparison_unit_id         :integer
#  lock_version               :integer          default(0)
#

class AnomalyCommandLog < ApplicationRecord
end
