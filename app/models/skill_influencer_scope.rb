# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_influencer_scopes
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  influencer_scope_id :bigint           not null
#  skill_id            :bigint           not null
#
# Indexes
#
#  index_skill_influencer_scopes_on_influencer_scope_id  (influencer_scope_id)
#  index_skill_influencer_scopes_on_skill_id             (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (influencer_scope_id => influencer_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillInfluencerScope < ApplicationRecord
  belongs_to :skill
  belongs_to :influencer_scope
end
