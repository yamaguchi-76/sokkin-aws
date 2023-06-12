# frozen_string_literal: true

module Companies
  class AttendancesController < Companies::ApplicationController
    def index
      propositions = current_company.propositions.contracted
      @attendance = Attendance.where(proposition_id: propositions.ids)
    end

    def show
      @attendance = Attendance.find(params[:id])
      raise ActiveRecord::RecotdNotFound if other_company_attendance?

      @proposition_contracts = @attendance.user.proposition_contracts.order(created_at: "DESC")
      @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:year]).order(month: "ASC")
      @years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
      if @attendance.monthly_unit_prices.exists?
        @monthly_unit_price = @attendance.monthly_unit_prices.find_by(attendance_id: params[:id], month: params[:month])
      end
      if @attendance.operating_times.exists?
        @operating_times = @attendance.operating_times.days(params)
      end
      @payment_status = @attendance.payment_statuses.find_by(year: params[:year], month: params[:month])
    end

    private
      def other_company_attendance?
        @attendance.proposition.company != current_company
      end
  end
end
