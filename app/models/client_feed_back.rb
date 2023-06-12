# frozen_string_literal: true

# == Schema Information
#
# Table name: client_feed_backs
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
#  index_client_feed_backs_on_attendance_id  (attendance_id)
#
# Foreign Keys
#
#  fk_rails_...  (attendance_id => attendances.id)
#
class ClientFeedBack < ApplicationRecord
  belongs_to :attendance

  with_options presence: true do
    validates :within_time
    validates :achieved
    validates :communication
    validates :partner_skills
    validates :interview
    validates :request
  end
  validates :request, length: { maximum: 300 }

  enum within_time: { within_time_rank_e: 0, within_time_rank_d: 1, within_time_rank_c: 2, within_time_rank_b: 3, within_time_rank_a: 4 }
  enum achieved: { achieved_rank_e: 0, achieved_rank_d: 1, achieved_rank_c: 2, achieved_rank_b: 3, achieved_rank_a: 4 }
  enum communication: { communication_rank_e: 0, communication_rank_d: 1, communication_rank_c: 2, communication_rank_b: 3, communication_rank_a: 4 }
  enum partner_skills: { partner_skills_rank_e: 0, partner_skills_rank_d: 1, partner_skills_rank_c: 2, partner_skills_rank_b: 3, partner_skills_rank_a: 4 }
  enum interview: { hope: 0, do_not_want: 1 }
end
