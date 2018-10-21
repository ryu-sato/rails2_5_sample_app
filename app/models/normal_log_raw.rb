# == Schema Information
#
# Table name: normal_log_raws
#
#  id           :integer          not null, primary key
#  hostname     :string           not null
#  lock_version :integer          default(0)
#

class NormalLogRaw < ApplicationRecord
  has_many :tickets, inverse_of: :normal_log_raw
  has_many :normal_command_log_sets, inverse_of: :normal_log_raw

  has_one_attached :raw_log

  validates :normal_command_log_sets, length: { maximum: 2 }
  validates :hostname, presence: true, uniqueness: true

  def to_s
    "#{hostname} in normal"
  end
end
