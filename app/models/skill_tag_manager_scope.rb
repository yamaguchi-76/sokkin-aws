# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_tag_manager_scopes
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  skill_id             :bigint           not null
#  tag_manager_scope_id :bigint           not null
#
# Indexes
#
#  index_skill_tag_manager_scopes_on_skill_id              (skill_id)
#  index_skill_tag_manager_scopes_on_tag_manager_scope_id  (tag_manager_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (tag_manager_scope_id => tag_manager_scopes.id)
#
class SkillTagManagerScope < ApplicationRecord
  belongs_to :skill
  belongs_to :tag_manager_scope
end
