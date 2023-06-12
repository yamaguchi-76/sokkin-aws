# frozen_string_literal: true

# == Schema Information
#
# Table name: skill_user_survey_scopes
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  skill_id             :bigint           not null
#  user_survey_scope_id :bigint           not null
#
# Indexes
#
#  index_skill_user_survey_scopes_on_skill_id              (skill_id)
#  index_skill_user_survey_scopes_on_user_survey_scope_id  (user_survey_scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (skill_id => skills.id)
#  fk_rails_...  (user_survey_scope_id => user_survey_scopes.id)
#
FactoryBot.define do
  factory :skill_user_survey_scope do
    user_survey_scope { UserSurveyScope.all.sample }
  end
end
