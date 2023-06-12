# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_language_scopes
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  language_scope_id :bigint           not null
#  skill_id          :bigint           not null
#
# Indexes
#
#  index_skill_language_scopes_on_language_scope_id  (language_scope_id)
#  index_skill_language_scopes_on_skill_id           (skill_id)
#
# Foreign Keys
#
#  fk_rails_...  (language_scope_id => language_scopes.id)
#  fk_rails_...  (skill_id => skills.id)
#
FactoryBot.define do
  factory :skill_language_scope do
    language_scope { LanguageScope.all.sample }
  end
end
