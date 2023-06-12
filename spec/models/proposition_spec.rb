# frozen_string_literal: true

# == Schema Information
#
# Table name: propositions
#
#  id                                                      :bigint           not null, primary key
#  application_deadline(応募締切)                          :datetime
#  background(背景・課題)                                  :text(65535)
#  contract_period(契約期間/単位month)                     :integer
#  estimated_work_time_from(月間想定稼働時間From/単位hour) :integer
#  estimated_work_time_to(月間想定稼働時間To/単位hour)     :integer
#  image(画像)                                             :string(255)
#  ng_point(NG項目)                                        :text(65535)
#  note(備考)                                              :text(65535)
#  operation_start_at(稼働開始時期)                        :datetime
#  required_skill(必須スキル)                              :string(255)
#  status(ステータス)                                      :integer
#  title(案件名)                                           :string(255)
#  unit_price(単価/単位month)                              :integer
#  unit_price_per_hour(時給単価)                           :integer
#  welcome_skill(歓迎スキル)                               :string(255)
#  work_order(依頼業務)                                    :text(65535)
#  created_at                                              :datetime         not null
#  updated_at                                              :datetime         not null
#  company_id(会社、企業ID)                                :bigint           not null
#  industry_id(業界)                                       :bigint           not null
#
# Indexes
#
#  index_propositions_on_company_id   (company_id)
#  index_propositions_on_industry_id  (industry_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (industry_id => industries.id)
#
require "rails_helper"

RSpec.describe Proposition, type: :model do
  describe "scope" do
    before do
      freeze_time
    end

    describe ".entried" do
      subject { described_class.entried(user) }
      let!(:user) { create(:user) }
      let!(:entried_proposition) { create(:proposition) }
      let!(:enterable_proposition) { create(:proposition) }

      before do
        create(:proposition_entry, user: user, proposition: entried_proposition)
      end

      it "entry済みのpropositionのみ取得できること" do
        expect(subject.ids).to eq [entried_proposition.id]
      end
    end

    describe ".enterable" do
      subject { described_class.enterable(user) }
      let!(:user) { create(:user) }
      let!(:entried_proposition) { create(:proposition) }
      let!(:enterable_proposition) { create(:proposition) }

      before do
        create(:proposition_entry, user: user, proposition: entried_proposition)
      end

      it "entryが存在しないpropositionのみ取得できること" do
        expect(subject.ids).to eq [enterable_proposition.id]
      end
    end

    describe ".high_price_order" do
      subject { described_class.high_price_order(user) }
      let!(:user) { create(:user) }
      let!(:entried_proposition) { create(:proposition, unit_price: 200) }
      let!(:enterable_proposition) { create(:proposition, unit_price: 100) }

      let!(:enterable_propositions) do
        (1..10).map do |i|
          create(:proposition, unit_price: i)
        end
      end

      before do
        create(:proposition_entry, user: user, proposition: entried_proposition)
      end

      it "unit_price降順で10件のpropositionのみ取得できること" do
        expect(subject.map(&:unit_price)).to eq [100, 10, 9, 8, 7, 6, 5, 4, 3, 2,]
      end
    end

    describe ".new_order" do
      subject { described_class.new_order(user) }

      let(:now) { Time.current }

      let!(:user) { create(:user) }
      let!(:entried_proposition) { create(:proposition, created_at: now.since(30.day)) }
      let!(:enterable_proposition20) { create(:proposition, created_at: now.since(20.day)) }
      let!(:enterable_proposition10) { create(:proposition, created_at: now.since(10.day)) }
      let!(:enterable_proposition9) { create(:proposition, created_at: now.since(9.day)) }
      let!(:enterable_proposition8) { create(:proposition, created_at: now.since(8.day)) }
      let!(:enterable_proposition7) { create(:proposition, created_at: now.since(7.day)) }
      let!(:enterable_proposition6) { create(:proposition, created_at: now.since(6.day)) }
      let!(:enterable_proposition5) { create(:proposition, created_at: now.since(5.day)) }
      let!(:enterable_proposition4) { create(:proposition, created_at: now.since(4.day)) }
      let!(:enterable_proposition3) { create(:proposition, created_at: now.since(3.day)) }
      let!(:enterable_proposition2) { create(:proposition, created_at: now.since(2.day)) }
      let!(:enterable_proposition1) { create(:proposition, created_at: now.since(1.day)) }

      before do
        create(:proposition_entry, user: user, proposition: entried_proposition)
      end

      it "created_at降順で10件のpropositionのみ取得できること" do
        expect(subject.map(&:created_at)).to eq [
          now.since(20.day),
          now.since(10.day),
          now.since(9.day),
          now.since(8.day),
          now.since(7.day),
          now.since(6.day),
          now.since(5.day),
          now.since(4.day),
          now.since(3.day),
          now.since(2.day),
        ]
      end
    end

    describe ".scoutable" do
      subject { described_class.scoutable(user, company) }

      let!(:user) { create(:user) }
      let!(:company) { create(:company) }

      let!(:scoutable_proposition) { create(:proposition, status: :wanted, company: company) }

      before do
        # 契約中の案件
        create(:proposition, status: :contracted, company: company)
        # 期限切れの案件
        create(:proposition, status: :expired, company: company)
        # 下書きの案件
        create(:proposition, status: :draft, company: company)
        # スカウト済みの案件
        scouted_proposition = create(:proposition, status: :wanted, company: company)
        create(:scout, user: user, proposition: scouted_proposition)
        # 他社案件
        other_company = create(:company)
        create(:proposition, status: :wanted, company: other_company)
        # スカウト可能案件で他ユーザーにスカウトしている状況
        other_user = create(:user)
        create(:scout, user: other_user, proposition: scoutable_proposition)
      end

      it "募集中かつ対象ユーザーがスカウトを受けていない自社案件のみ絞り込めること" do
        expect(subject).to eq [scoutable_proposition]
      end
    end
  end
end
