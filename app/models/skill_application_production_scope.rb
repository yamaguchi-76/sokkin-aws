# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_application_production_scopes
#
#  id                              :bigint           not null, primary key
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  application_production_scope_id :bigint           not null
#  skill_id                        :bigint           not null
#
# Indexes
#
#  fk_rails_dda515e829                           (application_production_scope_id)
#  skill_on_application_production_scopes_index  (skill_id,application_production_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (application_production_scope_id => application_production_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillApplicationProductionScope < ApplicationRecord
  belongs_to :skill
  belongs_to :application_production_scope
end
