# frozen_string_literal: true

class PropositionMember < ApplicationRecord
  belongs_to :user
  belongs_to :proposition
end
