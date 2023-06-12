# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_seo_scopes
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  seo_scope_id :bigint           not null
#  skill_id     :bigint           not null
#
# Indexes
#
#  index_skill_seo_scopes_on_seo_scope_id  (seo_scope_id)
#  index_skill_seo_scopes_on_skill_id      (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (seo_scope_id => seo_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillSeoScope < ApplicationRecord
  belongs_to :skill
  belongs_to :seo_scope
end
