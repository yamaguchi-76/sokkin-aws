# frozen_string_literal: true

# == Schema Information
#
# Table name: application_ad_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ApplicationAdScope < ApplicationRecord
  has_many :skill_application_ad_scopes, dependent: :destroy
  has_many :skills, through: :skill_application_ad_scopes
end
