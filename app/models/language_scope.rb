# frozen_string_literal: true

# == Schema Information
#
# Table name: language_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LanguageScope < ApplicationRecord
  has_many :skill_language_scopes, dependent: :destroy
  has_many :skills, through: :skill_language_scopes
end
