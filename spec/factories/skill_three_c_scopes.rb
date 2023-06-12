# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_three_c_scopes
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  skill_id         :bigint           not null
#  three_c_scope_id :bigint           not null
#
# Indexes
#
#  index_skill_three_c_scopes_on_skill_id          (skill_id)
#  index_skill_three_c_scopes_on_three_c_scope_id  (three_c_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (three_c_scope_id => three_c_scopes.id)
#
FactoryBot.define do
  factory :skill_three_c_scope do
    three_c_scope { ThreeCScope.all.sample }
  end
end
