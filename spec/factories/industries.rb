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
FactoryBot.define do
  factory :industry do
    industry_group
    name { "test-industry" }
    sequence(:display_sort)
  end
end
