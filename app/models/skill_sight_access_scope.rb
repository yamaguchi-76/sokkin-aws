# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_sight_access_scopes
#
#  id                    :bigint           not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  sight_access_scope_id :bigint           not null
#  skill_id              :bigint           not null
#
# Indexes
#
#  index_skill_sight_access_scopes_on_sight_access_scope_id  (sight_access_scope_id)
#  index_skill_sight_access_scopes_on_skill_id               (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (sight_access_scope_id => sight_access_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillSightAccessScope < ApplicationRecord
  belongs_to :skill
  belongs_to :sight_access_scope
end
