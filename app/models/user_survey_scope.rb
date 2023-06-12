# frozen_string_literal: true

# == Schema Information
#
# Table name: user_survey_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSurveyScope < ApplicationRecord
  has_many :skill_user_survey_scopes, dependent: :destroy
  has_many :skills, through: :skill_user_survey_scopes
end
