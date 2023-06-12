# frozen_string_literal: true

module Users
  class OperatingTimesController < Users::ApplicationController
    def index
      @proposition_contracts = current_user.proposition_contracts.order(created_at: "DESC")
      @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
      @all_monthly_unit_prices = @attendance.monthly_unit_prices
      @unit_prices_years = @all_monthly_unit_prices.map { |x| [x.year, x.month] }.uniq(&:first)
      @monthly_unit_prices = @all_monthly_unit_prices.where(year: params[:year]).order(created_at: "DESC")
      @monthly_unit_price = @monthly_unit_prices.find_by(month: params[:month])
      @operating_times = @attendance.operating_times.days(params)
    end

    def update_operating_times
      @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
      ids = []
      @operating_times = params[:operating_times].values.each do |o|
        ids << o["id"]
      end
      OperatingTime.update(ids, params[:operating_times].values)
      @attendance_date = @operating_times[0]["working_days"].split("-")
      redirect_to users_attendance_path(@attendance, year: @attendance_date[0], month: @attendance_date[1])
    end

    def hand_in_operating_times
      @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
      @operating_times = @attendance.operating_times.days(params)
      @operating_times.update_all(submitted: true)
      redirect_to users_attendance_path(@attendance, year: params[:year], month: params[:month])
    end

    def create
      @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
      if @attendance.operating_times.exists?(working_days: params[:working_days])
        redirect_to request.referer, alert: "その日付の勤怠データが既に存在します"
      else
        @operating_time = @attendance.operating_times.new(operating_time_params)
        if @operating_time.save
          redirect_to users_attendance_path(@attendance, year: @operating_time.working_days.year, month: @operating_time.working_month), notice: "勤怠を作成しました"
        else
          redirect_to request.referer
        end
      end
    end

    private
      def operating_time_params
        params.permit(:working_month,
                      :working_days,
                      :working_hours,
                      :job_description,
                      :attendance_id)
      end
  end
end
