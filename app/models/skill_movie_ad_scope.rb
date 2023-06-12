# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_movie_ad_scopes
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  movie_ad_scope_id :bigint           not null
#  skill_id          :bigint           not null
#
# Indexes
#
#  index_skill_movie_ad_scopes_on_movie_ad_scope_id  (movie_ad_scope_id)
#  index_skill_movie_ad_scopes_on_skill_id           (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_ad_scope_id => movie_ad_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillMovieAdScope < ApplicationRecord
  belongs_to :skill
  belongs_to :movie_ad_scope
end
