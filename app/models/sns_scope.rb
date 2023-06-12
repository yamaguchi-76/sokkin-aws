# frozen_string_literal: true

# == Schema Information
#
# Table name: sns_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SnsScope < ApplicationRecord
  has_many :skill_sns_scopes, dependent: :destroy
  has_many :skills, through: :skill_sns_scopes
end
