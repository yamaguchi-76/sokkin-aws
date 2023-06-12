# frozen_string_literal: true

module Users
  class HomeController < Users::ApplicationController
    def index
      @high_price_propositions = Proposition.high_price_order(current_user)
      @new_propositions = Proposition.new_order(current_user)
    end
  end
end
