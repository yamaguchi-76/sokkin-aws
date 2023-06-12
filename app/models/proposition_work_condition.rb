# frozen_string_literal: true

# == Schema Information
#
# Table name: proposition_work_conditions
#
#  id                            :bigint           not null, primary key
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  proposition_id(案件ID)        :bigint           not null
#  work_condition_id(勤務条件ID) :bigint           not null
#
# Indexes
#
#  index_proposition_work_conditions_on_proposition_id     (proposition_id)
#  index_proposition_work_conditions_on_work_condition_id  (work_condition_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposition_id => propositions.id)
#  fk_rails_...  (work_condition_id => work_conditions.id)
#
class PropositionWorkCondition < ApplicationRecord
  belongs_to :proposition
  belongs_to :work_condition
end
