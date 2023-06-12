# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_four_p_scopes
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  four_p_scope_id :bigint           not null
#  skill_id        :bigint           not null
#
# Indexes
#
#  index_skill_four_p_scopes_on_four_p_scope_id  (four_p_scope_id)
#  index_skill_four_p_scopes_on_skill_id         (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (four_p_scope_id => four_p_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_four_p_scope do
    four_p_scope { FourPScope.all.sample }
  end
end
