# frozen_string_literal: true

# == Schema Information
#
# Table name: three_c_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ThreeCScope < ApplicationRecord
  has_many :skill_three_c_scopes, dependent: :destroy
  has_many :skills, through: :skill_three_c_scopes
end
