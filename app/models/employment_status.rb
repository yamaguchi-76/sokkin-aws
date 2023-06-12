# frozen_string_literal: true

# == Schema Information
#
# Table name: employment_statuses
#
#  id                                    :bigint           not null, primary key
#  business_experience(経験業務内容)     :text(65535)
#  company_name(会社名)                  :string(255)      default(""), not null
#  employment_end_date(就業終了年月)     :date
#  employment_start_date(就業開始年月)   :date
#  in_employment(現在の就業状況)         :boolean
#  industry_category(業種)               :string(255)      default(""), not null
#  job_title(役職)                       :string(255)
#  status(就業形態)                      :integer          default("employee"), not null
#  update_count                          :integer          default(0), not null
#  working_days_of_the_week(稼働時間/日) :integer          default(0), not null
#  working_hours(稼働日/週)              :integer          default(0), not null
#  yearly_income(年収)                   :integer          default(0), not null
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  job_kind_id(職種)                     :bigint
#  user_id(ユーザーID)                   :bigint           not null
#
# Indexes
#
#  index_employment_statuses_on_job_kind_id  (job_kind_id)
#  index_employment_statuses_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class EmploymentStatus < ApplicationRecord
  belongs_to :user
  belongs_to :job_kind, optional: true

  # TODO: 会員登録formで
  #       working_days_of_the_week と working_hours が逆になったままリリースされてしまったため、将来的には修正をしたい

  enum status: { employee: 0, freelance: 1, others: 2 }

  with_options presence: true, on: :update do
    validates :status
    validates :company_name
    validates :industry_category
    validates :job_kind_id
    validates :employment_start_date
  end

  def ever_updated?
    created_at != updated_at
  end

  def registered?
    update_count != 0
  end
end
