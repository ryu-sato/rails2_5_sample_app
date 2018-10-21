# == Schema Information
#
# Table name: anomaly_command_log_sets
#
#  id                 :integer          not null, primary key
#  type               :string           not null
#  anomaly_log_raw_id :integer
#  comparison_set_id  :integer
#  lock_version       :integer          default(0)
#

class AnomalyCommandLogSet < ApplicationRecord
end
