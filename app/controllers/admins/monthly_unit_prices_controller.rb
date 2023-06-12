# frozen_string_literal: true

module Admins
  class MonthlyUnitPricesController < ApplicationController
    before_action :set_attendance, only: %i[new create]

    def new
      @monthly_unit_price = MonthlyUnitPrice.new
      @proposition = @attendance.proposition
    end

    def create
      @proposition = @attendance.proposition
      @monthly_unit_price = @attendance.monthly_unit_prices.build(monthly_unit_price_params)

      if @monthly_unit_price.valid?
        ApplicationRecord.transaction do
          @monthly_unit_price.save!
          PaymentStatus.create!(attendance: @attendance, year: @monthly_unit_price.year, month: @monthly_unit_price.month)
        end
        redirect_to admins_attendances_path, notice: "新しい月単価を設定しました"
      else
        render :new
      end
    end

  private
    def monthly_unit_price_params
      params.require(:monthly_unit_price).permit(:unit_price,
                                                 :year,
                                                 :month,
                                                 :active)
    end

    def set_attendance
      @attendance = Attendance.find(params[:attendance_id])
    end
  end
end
