# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_customer_scopes
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  customer_scope_id :bigint           not null
#  skill_id          :bigint           not null
#
# Indexes
#
#  index_skill_customer_scopes_on_customer_scope_id  (customer_scope_id)
#  index_skill_customer_scopes_on_skill_id           (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_scope_id => customer_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
class SkillCustomerScope < ApplicationRecord
  belongs_to :skill
  belongs_to :customer_scope
end
