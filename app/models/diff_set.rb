# == Schema Information
#
# Table name: diff_sets
#
#  id           :integer          not null, primary key
#  diff_summary :string           not null
#  lock_version :integer          default(0)
#  phase        :string           not null
#  ticket_id    :integer
#
# Indexes
#
#  index_diff_sets_on_ticket_id  (ticket_id)
#

class DiffSet < ApplicationRecord
  include HasProcessingPhase

  belongs_to :ticket, inverse_of: :diff_sets, optional: true
  has_many :diff_units, inverse_of: :diff_set, dependent: :destroy

  validates :diff_summary, presence: true
end
