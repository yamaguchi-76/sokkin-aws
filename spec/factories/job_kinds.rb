# frozen_string_literal: true

# == Schema Information
#
# Table name: job_kinds
#
#  id                   :bigint           not null, primary key
#  display_sort(表示順) :integer          not null
#  name(職種名)         :string(255)      not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_job_kinds_on_display_sort  (display_sort) UNIQUE
#
FactoryBot.define do
  factory :job_kind do
    name { "example_name" }
    sequence(:display_sort)
  end
end
