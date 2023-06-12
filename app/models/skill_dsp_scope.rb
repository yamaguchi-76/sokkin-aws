# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_dsp_scopes
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  dsp_scope_id :bigint           not null
#  skill_id     :bigint           not null
#
# Indexes
#
#  index_skill_dsp_scopes_on_dsp_scope_id  (dsp_scope_id)
#  index_skill_dsp_scopes_on_skill_id      (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (dsp_scope_id => dsp_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillDspScope < ApplicationRecord
  belongs_to :skill
  belongs_to :dsp_scope
end
