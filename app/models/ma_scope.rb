# frozen_string_literal: true

# == Schema Information
#
# Table name: ma_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MaScope < ApplicationRecord
  has_many :skill_ma_scopes, dependent: :destroy
  has_many :skills, through: :skill_ma_scopes
end
