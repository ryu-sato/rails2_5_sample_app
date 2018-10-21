# == Schema Information
#
# Table name: normal_command_logs
#
#  id                        :integer          not null, primary key
#  lock_version              :integer          default(0)
#  name                      :string           not null
#  result                    :string           not null
#  normal_command_log_set_id :integer
#
# Indexes
#
#  index_normal_command_logs_on_normal_command_log_set_id  (normal_command_log_set_id)
#

class NormalCommandLog < ApplicationRecord
  belongs_to :normal_command_log_set, inverse_of: :normal_command_logs

  def low_priority?
    name =~ /^request support information/
  end
end
