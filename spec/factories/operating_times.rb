# frozen_string_literal: true

# == Schema Information
#
# Table name: operating_times
#
#  id                        :bigint           not null, primary key
#  job_description(業務内容) :string(255)
#  status(提出ステータス)    :boolean          default(FALSE), not null
#  working_days(稼働日)      :date             not null
#  working_hours(稼働時間)   :integer          not null
#  working_month(稼働月)     :integer          not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  attendance_id(勤怠ID)     :bigint           not null
#
# Indexes
#
#  index_operating_times_on_attendance_id  (attendance_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendance_id => attendances.id)
#
FactoryBot.define do
  factory :operating_time do
  end
end
