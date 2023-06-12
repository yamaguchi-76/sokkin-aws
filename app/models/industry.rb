# frozen_string_literal: true

# == Schema Information
#
# Table name: industries
#
#  id                   :bigint           not null, primary key
#  display_sort(表示順) :integer          not null
#  name(業界名)         :string(255)      not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  industry_group_id    :bigint           not null
#
# Indexes
#
#  index_industries_on_industry_group_id  (industry_group_id)
#
class Industry < ApplicationRecord
  belongs_to :industry_group

  has_many :propositions

  validates :name, presence: true
  validates :display_sort, presence: true, uniqueness: { scope: :industry_group }

  scope :default_sorted, -> { all.order(display_sort: :asc) }
end
