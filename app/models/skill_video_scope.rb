# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_video_scopes
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  skill_id       :bigint           not null
#  video_scope_id :bigint           not null
#
# Indexes
#
#  index_skill_video_scopes_on_skill_id        (skill_id)
#  index_skill_video_scopes_on_video_scope_id  (video_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (video_scope_id => video_scopes.id)
#
class SkillVideoScope < ApplicationRecord
  belongs_to :skill
  belongs_to :video_scope
end
