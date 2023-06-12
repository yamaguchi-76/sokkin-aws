# frozen_string_literal: true

# == Schema Information
#
# Table name: pr_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PrScope < ApplicationRecord
  has_many :skill_pr_scopes, dependent: :destroy
  has_many :skills, through: :skill_pr_scopes
end
