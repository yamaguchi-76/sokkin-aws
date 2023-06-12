# frozen_string_literal: true

# == Schema Information
#
# Table name: tag_manager_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TagManagerScope < ApplicationRecord
  has_many :skill_tag_manager_scopes, dependent: :destroy
  has_many :skills, through: :skill_tag_manager_scopes
end
