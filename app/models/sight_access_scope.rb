# frozen_string_literal: true

# == Schema Information
#
# Table name: sight_access_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SightAccessScope < ApplicationRecord
  has_many :skill_sight_access_scopes, dependent: :destroy
  has_many :skills, through: :skill_sight_access_scopes
end
