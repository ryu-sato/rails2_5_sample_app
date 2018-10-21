# == Schema Information
#
# Table name: normal_command_log_sets
#
#  id                :integer          not null, primary key
#  type              :string           not null
#  normal_log_raw_id :integer
#  comparison_set_id :integer
#  lock_version      :integer          default(0)
#

class NormalCommandLogSet < ApplicationRecord
end
