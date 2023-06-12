# frozen_string_literal: true

module Companies
  class ScoutedUsersController < Companies::ApplicationController
    def index
      propositions = Proposition.where(company: current_company)
      @scouts = Scout.consider.company.where(proposition: propositions)
    end
  end
end
