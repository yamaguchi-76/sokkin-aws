# frozen_string_literal: true

module Admins
  class PropositionEntriesController < ApplicationController
    def index
      @proposition_entries = PropositionEntry.left_joins(:user, proposition: :company)
                                             .order(created_at: :desc)
    end

    def update_status
      entry = PropositionEntry.find(params[:id])
      ApplicationRecord.transaction do
        PropositionEntry.lock
        entry.update_next_status!
      end
      redirect_to admins_proposition_path(entry.proposition)
    end
  end
end
