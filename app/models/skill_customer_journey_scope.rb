# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_customer_journey_scopes
#
#  id                        :bigint           not null, primary key
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  customer_journey_scope_id :bigint           not null
#  skill_id                  :bigint           not null
#
# Indexes
#
#  fk_rails_e7d1aea932                     (customer_journey_scope_id)
#  skill_on_customer_journey_scopes_index  (skill_id,customer_journey_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_journey_scope_id => customer_journey_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillCustomerJourneyScope < ApplicationRecord
  belongs_to :skill
  belongs_to :customer_journey_scope
end
