# == Schema Information
#
# Table name: hosts
#
#  id           :integer          not null, primary key
#  lock_version :integer          default(0)
#  maker        :string           not null
#  name         :string           not null
#

class Host < ApplicationRecord
  VALID_MAKERS = ['juniper', 'cisco', 'alcatel'].freeze

  has_many :tickets, inverse_of: :host

  validates :maker, inclusion: { in: VALID_MAKERS }
  validates :name, presence: true

  def to_s
    "#{name} / #{maker}"
  end
end
