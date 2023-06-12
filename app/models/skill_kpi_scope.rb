# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_kpi_scopes
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  kpi_scope_id :bigint           not null
#  skill_id     :bigint           not null
#
# Indexes
#
#  index_skill_kpi_scopes_on_kpi_scope_id  (kpi_scope_id)
#  index_skill_kpi_scopes_on_skill_id      (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (kpi_scope_id => kpi_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillKpiScope < ApplicationRecord
  belongs_to :skill
  belongs_to :kpi_scope
end
