# frozen_string_literal: true

# == Schema Information
#
# Table name: third_party_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ThirdPartyScope < ApplicationRecord
  has_many :skill_third_party_scopes, dependent: :destroy
  has_many :skills, through: :skill_third_party_scopes
end
