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
FactoryBot.define do
  factory :proposition do
    company
    industry

    title { Faker::Restaurant.name }
    contract_period { (1..12).to_a.sample }
    estimated_work_time_from { [1, 2].sample }
    estimated_work_time_to { [3.4].sample }
    operation_start_at { Time.current }
    status { :wanted }
    unit_price { (1..10).to_a.sample }
    application_deadline { rand(Time.current.since(1.day)..Time.current.since(1.year)) }
    background { "はいけい・かだい" }
    required_skill { "ひっすすきる" }
    welcome_skill { "かんげいすきる" }
    work_order { "いらいぎょうむ" }
    unit_price_per_hour { (1..10).to_a.sample }

    trait :with_job_kinds do
      transient do
        job_kind_count { 1 }
      end

      after :create do |proposition, evaluator|
        JobKind.order("RAND()").limit(evaluator.job_kind_count).each do |job_kind|
          proposition.job_kinds << job_kind
        end
      end
    end

    trait :with_work_ranges do
      transient do
        work_range_count { 1 }
      end

      after :create do |proposition, evaluator|
        WorkRange.order("RAND()").limit(evaluator.work_range_count).each do |work_range|
          proposition.work_ranges << work_range
        end
      end
    end

    trait :with_work_conditions do
      transient do
        work_condition_count { 1 }
      end

      after :create do |proposition, evaluator|
        WorkCondition.order("RAND()").limit(evaluator.work_condition_count).each do |work_condition|
          proposition.work_conditions << work_condition
        end
      end
    end
  end
end
