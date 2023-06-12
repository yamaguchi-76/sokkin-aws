# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_display_scopes
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  display_scope_id :bigint           not null
#  skill_id         :bigint           not null
#
# Indexes
#
#  index_skill_display_scopes_on_display_scope_id  (display_scope_id)
#  index_skill_display_scopes_on_skill_id          (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (display_scope_id => display_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_display_scope do
    display_scope { DisplayScope.all.sample }
  end
end
