# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_persona_scopes
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  persona_scope_id :bigint           not null
#  skill_id         :bigint           not null
#
# Indexes
#
#  index_skill_persona_scopes_on_persona_scope_id  (persona_scope_id)
#  index_skill_persona_scopes_on_skill_id          (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (persona_scope_id => persona_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_persona_scope do
    persona_scope { PersonaScope.all.sample }
  end
end
