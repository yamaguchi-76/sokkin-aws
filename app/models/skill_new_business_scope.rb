# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_new_business_scopes
#
#  id                    :bigint           not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  new_business_scope_id :bigint           not null
#  skill_id              :bigint           not null
#
# Indexes
#
#  index_skill_new_business_scopes_on_new_business_scope_id  (new_business_scope_id)
#  index_skill_new_business_scopes_on_skill_id               (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (new_business_scope_id => new_business_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillNewBusinessScope < ApplicationRecord
  belongs_to :skill
  belongs_to :new_business_scope
end
