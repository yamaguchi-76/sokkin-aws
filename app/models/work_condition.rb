# frozen_string_literal: true

# == Schema Information
#
# Table name: work_conditions
#
#  id                   :bigint           not null, primary key
#  display_sort(表示順) :integer          not null
#  name(勤務条件名)     :string(255)      not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_work_conditions_on_display_sort  (display_sort) UNIQUE
#
class WorkCondition < ApplicationRecord
  # 勤務条件マスタ
  has_many :proposition_work_conditions
  has_many :propositions, through: :proposition_work_conditions

  validates :name, presence: true
  validates :display_sort, presence: true, uniqueness: true
end
