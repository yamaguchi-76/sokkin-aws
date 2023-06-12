# frozen_string_literal: true

# == Schema Information
#
# Table name: scouts
#
#  id                                :bigint           not null, primary key
#  scout_from(スカウトを出したModel) :integer          not null
#  status(ステータス)                :integer          not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  proposition_id(案件ID)            :bigint           not null
#  user_id(ユーザーID)               :bigint           not null
#
# Indexes
#
#  index_scouts_on_proposition_id  (proposition_id)
#  index_scouts_on_user_id         (user_id)
#
FactoryBot.define do
  factory :scout do
    user
    proposition

    status { :consider }
    scout_from { %i[admin company].sample }
  end
end
