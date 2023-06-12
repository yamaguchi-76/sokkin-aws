# frozen_string_literal: true

# == Schema Information
#
# Table name: proposition_contracts
#
#  id                          :bigint           not null, primary key
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  proposition_id(案件ID)      :bigint           not null
#  user_id(成約したユーザーID) :bigint           not null
#
# Indexes
#
#  index_proposition_contracts_on_proposition_id  (proposition_id)
#  index_proposition_contracts_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposition_id => propositions.id)
#  fk_rails_...  (user_id => users.id)
#
class PropositionContract < ApplicationRecord
  belongs_to :proposition
  belongs_to :user
end
