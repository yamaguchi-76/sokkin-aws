# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_feed_scopes
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  feed_scope_id :bigint           not null
#  skill_id      :bigint           not null
#
# Indexes
#
#  index_skill_feed_scopes_on_feed_scope_id  (feed_scope_id)
#  index_skill_feed_scopes_on_skill_id       (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (feed_scope_id => feed_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillFeedScope < ApplicationRecord
  belongs_to :skill
  belongs_to :feed_scope
end
