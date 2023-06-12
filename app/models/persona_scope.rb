# frozen_string_literal: true

# == Schema Information
#
# Table name: persona_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PersonaScope < ApplicationRecord
  has_many :skill_persona_scopes, dependent: :destroy
  has_many :skills, through: :skill_persona_scopes
end
