# frozen_string_literal: true

# == Schema Information
#
# Table name: double_job_experiences
#
#  id                                        :bigint           not null, primary key
#  business_experience(業務内容)             :text(65535)
#  company_name(会社名)                      :string(255)      default(""), not null
#  employment_end_date(複業時の就業終了年月) :date
#  employment_start_date(複業開始年月)       :date
#  monthly_income(月収)                      :integer          default(0), not null
#  working_hours(稼働時間)                   :integer
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#  job_kind_id(職種)                         :bigint           not null
#  user_id(ユーザーID)                       :bigint           not null
#
# Indexes
#
#  index_double_job_experiences_on_job_kind_id  (job_kind_id)
#  index_double_job_experiences_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (job_kind_id => job_kinds.id)
#  fk_rails_...  (user_id => users.id)
#
#
FactoryBot.define do
  factory :double_job_experience do
    job_kind { JobKind.all.sample }
    company_name { "MyString" }
    employment_start_date { Time.current }
    employment_end_date { Time.current }
    monthly_income { 1 }
    working_hours { 1 }
    business_experience { "MyText" }
  end
end
