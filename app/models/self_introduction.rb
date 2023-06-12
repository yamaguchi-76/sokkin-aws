# frozen_string_literal: true

# == Schema Information
#
# Table name: self_introductions
#
#  id                                     :bigint           not null, primary key
#  desired_unit_price(希望単価)           :integer          default(0), not null
#  desired_working_days(希望勤務日数)     :integer          default(0), not null
#  desired_working_hours(希望稼働時間)    :integer          default(0), not null
#  handle_conditions(対応条件)            :integer          default("freelance"), not null
#  handle_status(対応ステータス)          :integer          default("now"), not null
#  in_person_meeting(対面ミーティング)    :integer          default("possible"), not null
#  invoice_number(インボイス登録番号)     :string(255)
#  portfolio(ポートフォリオ)              :string(255)
#  registered_invoice(インボイス登録有無) :boolean          default(FALSE)
#  self_pr(自己PR)                        :text(65535)
#  update_count                           :integer          default(0), not null
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  user_id(ユーザーID)                    :bigint           not null
#
# Indexes
#
#  index_self_introductions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class SelfIntroduction < ApplicationRecord
  belongs_to :user

  enum in_person_meeting: { possible: 0, impossible: 1 }
  enum handle_status: { now: 0, good_proposition: 1, three_month: 2, no_status: 3 }
  enum handle_conditions: { freelance: 0, double_job: 1, no_conditions: 2 }

  VALID_INVOICE_NUMBER_REGEX = /\A[0-9]{13}\z/
  private_constant :VALID_INVOICE_NUMBER_REGEX

  validates :invoice_number, allow_blank: true, format: { with: VALID_INVOICE_NUMBER_REGEX }

  with_options presence: true, on: :update do
    validates :self_pr
    validates :desired_unit_price
    validates :desired_working_days
    validates :desired_working_hours
    validates :in_person_meeting
    validates :handle_status
    validates :handle_conditions
  end

  def ever_updated?
    created_at != updated_at
  end

  def show_desired_unit_price_to_b
    (desired_unit_price / 0.7).round
  end

  def registered?
    update_count != 0
  end
end
