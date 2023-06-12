# frozen_string_literal: true

# == Schema Information
#
# Table name: proposition_work_ranges
#
#  id                     :bigint           not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  proposition_id(案件ID) :bigint           not null
#  work_range_id(職域ID)  :bigint           not null
#
# Indexes
#
#  index_proposition_work_ranges_on_proposition_id  (proposition_id)
#  index_proposition_work_ranges_on_work_range_id   (work_range_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposition_id => propositions.id)
#  fk_rails_...  (work_range_id => work_ranges.id)
#
class PropositionWorkRange < ApplicationRecord
  belongs_to :proposition
  belongs_to :work_range
end
