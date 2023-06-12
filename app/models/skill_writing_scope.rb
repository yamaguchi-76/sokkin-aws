# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_writing_scopes
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  skill_id         :bigint           not null
#  writing_scope_id :bigint           not null
#
# Indexes
#
#  index_skill_writing_scopes_on_skill_id          (skill_id)
#  index_skill_writing_scopes_on_writing_scope_id  (writing_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (writing_scope_id => writing_scopes.id)
#
class SkillWritingScope < ApplicationRecord
  belongs_to :skill
  belongs_to :writing_scope
end
