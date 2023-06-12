# frozen_string_literal: true

module Companies
  class PropositionEntriesController < Companies::ApplicationController
    # GET /companies/proposition_entries
    def index
      @q = PropositionEntry.joins(:proposition, :user)
                           .merge(Proposition.where(company: current_company))
                           .ransack(params[:q])
      @proposition_entries = @q.result(distinct: true)
    end

    # GET /companies/proposition_entries/:id/entry_user
    def entry_user
      @user = PropositionEntry.left_joins(:proposition, user: [:educational_background, :self_introduction, :skill])
                              .merge(Proposition.where(company: current_company))
                              .merge(User.active)
                              .find_by!(id: params[:id])
                              .user
    end
  end
end
