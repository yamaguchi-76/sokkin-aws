# frozen_string_literal: true

# == Schema Information
#
# Table name: payment_statuses
#
#  id                     :bigint           not null, primary key
#  month(月)              :integer          not null
#  paid(支払いステータス) :integer          not null
#  year(年)               :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  attendance_id(勤怠ID)  :bigint           not null
#
# Indexes
#
#  index_payment_statuses_on_attendance_id  (attendance_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendance_id => attendances.id)
#
class PaymentStatus < ApplicationRecord
  belongs_to :attendance

  enum paid: { incomplete: 0, completion: 1,  confirming: 2 }
end
