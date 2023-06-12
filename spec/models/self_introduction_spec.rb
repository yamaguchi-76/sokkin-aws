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
require "rails_helper"

RSpec.describe SelfIntroduction, type: :model do
  describe "validate" do
    it { is_expected.to belong_to(:user) }

    describe "invoice_number" do
      it { is_expected.to allow_value(nil).for(:invoice_number) }
      it { is_expected.to allow_value("1" * 13).for(:invoice_number) }
      it { is_expected.not_to allow_value("1" * 12).for(:invoice_number) }
      it { is_expected.not_to allow_value("1" * 14).for(:invoice_number) }
      it { is_expected.not_to allow_value(("1" * 12) + "a").for(:invoice_number) }
    end
  end
end
