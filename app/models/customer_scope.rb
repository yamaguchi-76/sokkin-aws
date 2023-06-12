# frozen_string_literal: true

# == Schema Information
#
# Table name: customer_scopes
#
#  id         :bigint           not null, primary key
#  answer     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CustomerScope < ApplicationRecord
  has_many :skill_customer_scopes, dependent: :destroy
  has_many :skills, through: :skill_customer_scopes
end
