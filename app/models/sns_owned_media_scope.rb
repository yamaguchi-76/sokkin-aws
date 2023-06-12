# frozen_string_literal: true

# == Schema Information
#
# Table name: sns_owned_media_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SnsOwnedMediaScope < ApplicationRecord
  has_many :skill_sns_owned_media_scopes, dependent: :destroy
  has_many :skills, through: :skill_sns_owned_media_scopes
end
