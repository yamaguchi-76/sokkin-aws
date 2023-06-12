# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_sns_scopes
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  skill_id     :bigint           not null
#  sns_scope_id :bigint           not null
#
# Indexes
#
#  index_skill_sns_scopes_on_skill_id      (skill_id)
#  index_skill_sns_scopes_on_sns_scope_id  (sns_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (sns_scope_id => sns_scopes.id)
#
FactoryBot.define do
  factory :skill_sns_scope do
    sns_scope { SnsScope.all.sample }
  end
end
