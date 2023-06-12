# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id                     :bigint           not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  proposition_id(案件ID) :bigint           not null
#  user_id(ユーザーID)    :bigint           not null
#
# Indexes
#
#  index_attendances_on_proposition_id  (proposition_id)
#  index_attendances_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposition_id => propositions.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :attendance do
  end
end
