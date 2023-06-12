# frozen_string_literal: true

# == Schema Information
#
# Table name: proposition_entries
#
#  id                                              :bigint           not null, primary key
#  estimated_work_time(月間希望労働時間(単位hour)) :integer
#  request(ご要望)                                 :text(65535)
#  status(応募の状態)                              :integer          default("pending"), not null
#  created_at                                      :datetime         not null
#  updated_at                                      :datetime         not null
#  proposition_id(案件ID)                          :bigint           not null
#  user_id(応募したユーザーID)                     :bigint           not null
#
# Indexes
#
#  index_proposition_entries_on_proposition_id  (proposition_id)
#  index_proposition_entries_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposition_id => propositions.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :proposition_entry do
    user
    proposition
    status { %i[before_interview considering contracting rejected disbanded].sample }
    estimated_work_time { 1 }

    trait :before_interview do
      status { :before_interview }
    end

    trait :considering do
      status { :considering }
    end

    trait :contracting do
      status { :contracting }
    end

    trait :rejected do
      status { :rejected }
    end

    trait :disbanded do
      status { :disbanded }
    end
  end
end
