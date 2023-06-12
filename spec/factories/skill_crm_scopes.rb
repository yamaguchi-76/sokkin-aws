# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_crm_scopes
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  crm_scope_id :bigint           not null
#  skill_id     :bigint           not null
#
# Indexes
#
#  index_skill_crm_scopes_on_crm_scope_id  (crm_scope_id)
#  index_skill_crm_scopes_on_skill_id      (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (crm_scope_id => crm_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_crm_scope do
    crm_scope { CrmScope.all.sample }
  end
end
