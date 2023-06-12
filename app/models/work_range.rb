# frozen_string_literal: true

# == Schema Information
#
# Table name: work_ranges
#
#  id                   :bigint           not null, primary key
#  display_sort(表示順) :integer          not null
#  name(職域名)         :string(255)      not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_work_ranges_on_display_sort  (display_sort) UNIQUE
#
class WorkRange < ApplicationRecord
  # 職域マスタ
  has_many :proposition_work_ranges
  has_many :propositions, through: :proposition_work_ranges

  validates :name, presence: true
  validates :display_sort, presence: true, uniqueness: true
end
