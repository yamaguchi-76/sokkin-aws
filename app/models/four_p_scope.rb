# frozen_string_literal: true

# == Schema Information
#
# Table name: four_p_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FourPScope < ApplicationRecord
  has_many :skill_four_p_scopes, dependent: :destroy
  has_many :skills, through: :skill_four_p_scopes
end
