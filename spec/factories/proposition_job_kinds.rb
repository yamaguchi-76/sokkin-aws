# frozen_string_literal: true

# == Schema Information
#
# Table name: proposition_job_kinds
#
#  id                     :bigint           not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  job_kind_id(職種ID)    :bigint           not null
#  proposition_id(案件ID) :bigint           not null
#
# Indexes
#
#  index_proposition_job_kinds_on_job_kind_id     (job_kind_id)
#  index_proposition_job_kinds_on_proposition_id  (proposition_id)
#
# Foreign Keys
#
#  fk_rails_...  (job_kind_id => job_kinds.id)
#  fk_rails_...  (proposition_id => propositions.id)
#
FactoryBot.define do
  factory :proposition_job_kind do
  end
end
