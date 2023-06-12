# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_ecsite_scopes
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ecsite_scope_id :bigint           not null
#  skill_id        :bigint           not null
#
# Indexes
#
#  index_skill_ecsite_scopes_on_ecsite_scope_id  (ecsite_scope_id)
#  index_skill_ecsite_scopes_on_skill_id         (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (ecsite_scope_id => ecsite_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_ecsite_scope do
    ecsite_scope { EcsiteScope.all.sample }
  end
end
