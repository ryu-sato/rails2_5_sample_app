# == Schema Information
#
# Table name: command_logs
#
#  id                 :integer          not null, primary key
#  lock_version       :integer          default(0)
#  name               :string           not null
#  result             :string           not null
#  command_log_set_id :integer
#
# Indexes
#
#  index_command_logs_on_command_log_set_id  (command_log_set_id)
#

class CommandLog < ApplicationRecord
  belongs_to :command_log_set, inverse_of: :command_logs

  validates :name, presence: true
  validates :result, presence: true

  def low_priority?
    name =~ /^show system uptime/
  end
end
