# frozen_string_literal: true

module Users
  class PropositionEntriesController < ApplicationController
    # GET /users/proposition_entries
    def index
      @entries = current_user.proposition_entries
      @pending_proposition_entries = @entries.pending.joins(:proposition)
      @contracting_proposition_entries = @entries.contracting.joins(:proposition)
      @rejected_proposition_entries = @entries.rejected.joins(:proposition)
    end
  end
end
