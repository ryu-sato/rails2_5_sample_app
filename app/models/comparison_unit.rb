# == Schema Information
#
# Table name: comparison_units
#
#  id                :integer          not null, primary key
#  diff              :string           not null
#  lock_version      :integer          default(0)
#  name              :string           not null
#  comparison_set_id :integer
#  ticket_id         :integer
#
# Indexes
#
#  index_comparison_units_on_comparison_set_id  (comparison_set_id)
#  index_comparison_units_on_ticket_id          (ticket_id)
#

class ComparisonUnit < ApplicationRecord
  belongs_to :ticket
  belongs_to :comparison_set, inverse_of: :comparison_units

  def to_s
    normal_command_log = Ticket.preload(normal_log_raw: [normal_command_log_sets: :normal_command_logs])
                           .where(id: ticket.id, normal_log_raw: { normal_command_log_sets: { normal_command_logs: { name: name } } })
    anomaly_command_log = Ticket.preload(anomaly_log_raw: [anomaly_command_log_sets: :anomaly_command_logs])
                            .where(id: ticket.id, anomaly_log_raw: { anomaly_command_log_sets: { anomaly_command_logs: { name: name } } })
    "#{ normal_command_log&.name&.presence || 'Deleted'} / #{ anomaly_command_log&.name.presence || 'Deleted' }"
  end
end
