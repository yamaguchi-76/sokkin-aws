# frozen_string_literal: true

module Companies
  module UsersHelper
    def age_select
      (18..80).to_a
    end

    def desired_unit_price_select
      1000.step(100000, 500).to_a
    end

    def desired_working_hours_select
      (1..24).to_a
    end

    def desired_working_days_select
      (1..31).to_a
    end
  end
end
