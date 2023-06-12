# frozen_string_literal: true

# == Schema Information
#
# Table name: new_business_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class NewBusinessScope < ApplicationRecord
  has_many :skill_new_business_scopes, dependent: :destroy
  has_many :skills, through: :skill_new_business_scopes
end
