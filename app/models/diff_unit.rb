# == Schema Information
#
# Table name: diff_units
#
#  id           :integer          not null, primary key
#  abnormal_log :string
#  diff         :string
#  name         :string
#  normal_log   :string
#  diff_set_id  :integer
#
# Indexes
#
#  index_diff_units_on_diff_set_id  (diff_set_id)
#

class DiffUnit < ApplicationRecord
  belongs_to :diff_set, inverse_of: :diff_units, optional: true

  validates :diff, presence: true
  validates :name, presence: true
  validates :normal_log, presence: true
  validates :abnormal_log, presence: true
end
