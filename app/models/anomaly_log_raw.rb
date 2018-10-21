# == Schema Information
#
# Table name: anomaly_log_raws
#
#  id           :integer          not null, primary key
#  hostname     :string           not null
#  lock_version :integer          default(0)
#

class AnomalyLogRaw < ApplicationRecord
end
