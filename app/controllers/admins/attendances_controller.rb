# frozen_string_literal: true

module Admins
  class AttendancesController < ApplicationController
    def index
      @proposition_contracts = PropositionContract.joins(:user, :proposition).order(created_at: "DESC")
    end

    def show
      @attendance = Attendance.find(params[:id])
      @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:year]).order(month: "ASC")
      @monthly_unit_price = @attendance.monthly_unit_prices.find_by(year: params[:year], month: params[:month])
      @years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
      if @attendance.payment_statuses.exists?
        @payment_status = @attendance.payment_statuses.find_by(year: params[:year], month: params[:month])
      end
      if @attendance.monthly_unit_prices.exists?
        @monthly_unit_price = @attendance.monthly_unit_prices.find_by(month: params[:month])
      end
      if @attendance.operating_times.exists?
        @operating_times = @attendance.operating_times.days(params)
      end
      @feed_back = @attendance.feed_backs.find_by(attendance_id: params[:id], year: params[:year], month: params[:month])
      @client_feed_back = @attendance.client_feed_backs.find_by(attendance_id: params[:id], year: params[:year], month: params[:month])
    end

    def edit
      @attendance = Attendance.find(params[:id])
      @operating_times = @attendance.operating_times.days(params)
      @monthly_unit_price = @attendance.monthly_unit_prices.find_by(year: params[:year], month: params[:month])
      @feed_back = @attendance.feed_backs.find_by(attendance_id: params[:id], year: params[:year], month: params[:month])
      @client_feed_back = @attendance.client_feed_backs.find_by(attendance_id: params[:id], year: params[:year], month: params[:month])
      @payment_status = @attendance.payment_statuses.find_by(year: params[:year], month: params[:month])
    end

    def update
      @attendance = Attendance.find(params[:id])
      if @attendance.update(attendance_params)
        redirect_to admins_attendance_path(@attendance, year: @attendance.monthly_unit_prices.last.year, month: @attendance.monthly_unit_prices.last.month, user_id: @attendance.user_id)
      else
        render :edit
      end
    end

    private
      def attendance_params
        params.require(:attendance).permit(
          operating_times_attributes: [:id,
                                       :working_month,
                                       :working_days,
                                       :working_hours,
                                       :job_description,
                                       :_destroy],
          feed_backs_attributes: [:id,
                                  :year,
                                  :month,
                                  :within_time,
                                  :achieved,
                                  :communication,
                                  :partner_skills,
                                  :interview,
                                  :request,
                                  :_destroy],
          client_feed_backs_attributes: [:id,
                                         :year,
                                         :month,
                                         :within_time,
                                         :achieved,
                                         :communication,
                                         :partner_skills,
                                         :interview,
                                         :request,
                                         :_destroy],
          monthly_unit_prices_attributes: [:id,
                                           :year,
                                           :month,
                                           :active,
                                           :unit_price,
                                           :_destroy],
          payment_statuses_attributes: [:id,
                                        :paid,
                                        :_destroy]
        )
      end
  end
end
