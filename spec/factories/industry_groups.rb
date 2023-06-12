# frozen_string_literal: true

# == Schema Information
#
# Table name: industry_groups
#
#  id                   :bigint           not null, primary key
#  display_sort(表示順) :integer          not null
#  name(業界グループ名) :string(255)      not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_industry_groups_on_display_sort  (display_sort) UNIQUE
#
FactoryBot.define do
  factory :industry_group do
    name { "test-industry_group" }
    sequence(:display_sort)
  end
end
