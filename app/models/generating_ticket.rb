# == Schema Information
#
# Table name: generating_tickets
#
#  id                  :integer          not null, primary key
#  hostname            :string
#  ticket_code         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  abnormal_raw_log_id :bigint
#  normal_raw_log_id   :bigint
#

class GeneratingTicket < ApplicationRecord
end
