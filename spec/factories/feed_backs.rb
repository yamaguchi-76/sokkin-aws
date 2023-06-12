# frozen_string_literal: true

# == Schema Information
#
# Table name: feed_backs
#
#  id                                              :bigint           not null, primary key
#  achieved(業務遂行度)                            :integer          not null
#  communication(パートナーとのコミュニケーション) :integer          not null
#  interview(面談希望)                             :integer          not null
#  month(月)                                       :integer          not null
#  partner_skills(パートナーのスキル)              :integer          not null
#  request(要望・相談)                             :text(65535)      not null
#  within_time(稼働時間内か)                       :integer          not null
#  year(年)                                        :integer          not null
#  created_at                                      :datetime         not null
#  updated_at                                      :datetime         not null
#  attendance_id(勤怠ID)                           :bigint           not null
#
# Indexes
#
#  index_feed_backs_on_attendance_id  (attendance_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendance_id => attendances.id)
#
FactoryBot.define do
  factory :feed_back do
  end
end
