# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_search_scopes
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  search_scope_id :bigint           not null
#  skill_id        :bigint           not null
#
# Indexes
#
#  index_skill_search_scopes_on_search_scope_id  (search_scope_id)
#  index_skill_search_scopes_on_skill_id         (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (search_scope_id => search_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillSearchScope < ApplicationRecord
  belongs_to :skill
  belongs_to :search_scope
end
