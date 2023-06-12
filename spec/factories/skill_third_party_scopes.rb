# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_third_party_scopes
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  skill_id             :bigint           not null
#  third_party_scope_id :bigint           not null
#
# Indexes
#
#  index_skill_third_party_scopes_on_skill_id              (skill_id)
#  index_skill_third_party_scopes_on_third_party_scope_id  (third_party_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (third_party_scope_id => third_party_scopes.id)
#
FactoryBot.define do
  factory :skill_third_party_scope do
    third_party_scope { ThirdPartyScope.all.sample }
  end
end
