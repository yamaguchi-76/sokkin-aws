# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_business_scopes
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  business_scope_id :bigint           not null
#  skill_id          :bigint           not null
#
# Indexes
#
#  index_skill_business_scopes_on_business_scope_id  (business_scope_id)
#  index_skill_business_scopes_on_skill_id           (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_scope_id => business_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillBusinessScope < ApplicationRecord
  belongs_to :skill
  belongs_to :business_scope
end
