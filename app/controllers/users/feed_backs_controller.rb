# frozen_string_literal: true

module Users
  class FeedBacksController < Users::ApplicationController
    def new
      @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
      @proposition_contracts = current_user.proposition_contracts.order(created_at: "DESC")
      @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:year]).order(created_at: "DESC")
      @monthly_unit_price = @attendance.monthly_unit_prices.find_by(attendance_id: params[:attendance_id], year: params[:year], month: params[:month])
      @unit_prices_years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
      if @attendance.feed_backs.exists?(attendance_id: @attendance.id, year: params[:year], month: params[:month])
        @feed_back = @attendance.feed_backs.find_by(attendance_id: params[:attendance_id], year: params[:year], month: params[:month])
        redirect_to complete_users_attendance_feed_back_path(@feed_back, attendance_id: @attendance.id, year: @feed_back.year, month: @feed_back.month)
      else
        @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
        @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:year]).order(created_at: "DESC")
        @unit_prices_years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
        @feed_back = FeedBack.new
      end
    end

    def create
      @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
      @feed_back = @attendance.feed_backs.build(feed_back_params)
      if @feed_back.save
        redirect_to complete_users_attendance_feed_back_path(@feed_back, attendance_id: @attendance.id, year: @feed_back.year, month: @feed_back.month)
      else
        @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
        @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:feed_back][:year]).order(created_at: "DESC")
        @unit_prices_years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
        params[:year] = params[:feed_back][:year]
        params[:month] = params[:feed_back][:month]
        @proposition_contracts = current_user.proposition_contracts.order(created_at: "DESC")
        render :new
      end
    end

    def complete
      @attendance = Attendance.find_by!(id: params[:attendance_id], user_id: current_user.id)
      @unit_prices_years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
      @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:year]).order(created_at: "DESC")
      @feed_back = @attendance.feed_backs.find_by(attendance_id: params[:attendance_id], year: params[:year],  month: params[:month])
      @client_feed_back = @attendance.client_feed_backs.find_by(attendance_id: params[:attendance_id], year: params[:year],  month: params[:month])
    end

    private
      def feed_back_params
        params.require(:feed_back).permit(:year,
                                          :month,
                                          :within_time,
                                          :achieved,
                                          :communication,
                                          :partner_skills,
                                          :interview,
                                          :request,
                                          :attendance_id)
      end
  end
end
