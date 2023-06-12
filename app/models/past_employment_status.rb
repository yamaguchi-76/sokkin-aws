# frozen_string_literal: true

# == Schema Information
#
# Table name: past_employment_statuses
#
#  id                                          :bigint           not null, primary key
#  company_name(会社名)                        :string(255)      default(""), not null
#  employment_end_date(就業終了年月)           :date             not null
#  employment_start_date(就業開始年月)         :date             not null
#  previous_client_or_industry(担当顧客や業種) :string(255)      default(""), not null
#  created_at                                  :datetime         not null
#  updated_at                                  :datetime         not null
#  user_id(ユーザーID)                         :bigint           not null
#
# Indexes
#
#  index_past_employment_statuses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class PastEmploymentStatus < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :company_name
    validates :previous_client_or_industry
    validates :employment_start_date
    validates :employment_end_date
  end
end
