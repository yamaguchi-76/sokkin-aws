# frozen_string_literal: true

module Users
  class AttendancesController < Users::ApplicationController
    def index
      @proposition_contracts = current_user.proposition_contracts.order(created_at: "DESC")
    end

    def show
      @proposition_contracts = current_user.proposition_contracts.order(created_at: "DESC")
      @attendance = Attendance.find_by!(id: params[:id], user: current_user)
      year = params[:year]
      month = params[:month]
      @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: year)
      @years = @attendance.monthly_unit_prices.order(year: :asc).map { |x| [x.year, x.month] }.uniq(&:first)
      @monthly_unit_price = @attendance.monthly_unit_prices.find_by(year: year, month: month)
      @operating_times = @attendance.operating_times.target_date_range(year: year, month: month)
      @payment_status = @attendance.payment_statuses.find_by(year: year, month: month)
    end
  end
end
