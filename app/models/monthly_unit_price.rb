# frozen_string_literal: true

# == Schema Information
#
# Table name: monthly_unit_prices
#
#  id                           :bigint           not null, primary key
#  month(月)                    :integer          not null
#  status(アクティブステータス) :boolean          not null
#  unit_price(単価)             :integer          not null
#  year(年)                     :integer          not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  attendance_id(勤怠ID)        :bigint           not null
#
# Indexes
#
#  index_monthly_unit_prices_on_attendance_id  (attendance_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendance_id => attendances.id)
#
class MonthlyUnitPrice < ApplicationRecord
  belongs_to :attendance

  with_options presence: true do
    validates :unit_price
    validates :year
    validates :month
  end
end
