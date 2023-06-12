# frozen_string_literal: true

# == Schema Information
#
# Table name: display_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DisplayScope < ApplicationRecord
  has_many :skill_display_scopes, dependent: :destroy
  has_many :skills, through: :skill_display_scopes
end
