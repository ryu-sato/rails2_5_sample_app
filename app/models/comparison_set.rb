# == Schema Information
#
# Table name: comparison_sets
#
#  id           :integer          not null, primary key
#  diff_summary :string           not null
#  lock_version :integer          default(0)
#  phase        :string           not null
#  ticket_id    :integer
#
# Indexes
#
#  index_comparison_sets_on_ticket_id  (ticket_id)
#

class ComparisonSet < ApplicationRecord
  belongs_to :ticket

  def to_s
    normal_command_log_set = Ticket.preload(normal_log_raw: :normal_command_log_sets)
                               .where(id: ticket.id, normal_log_raw: { normal_command_log_sets: { phase: phase } })
    anomaly_command_log_set = Ticket.preload(anomaly_log_raw: :anomaly_command_log_sets)
                                .where(id: ticket.id, anomaly_log_raw: { anomaly_command_log_sets: { phase: phase } })
    "#{ normal_command_log_set&.phase&.presence || 'Deleted'} / #{ anomaly_command_log_set&.phase.presence || 'Deleted' }"
  end
end
