# frozen_string_literal: true

module Companies
  class ClientFeedBacksController < Companies::ApplicationController
    def new
      @attendance = Attendance.find(params[:attendance_id])
      raise ActiveRecord::RecotdNotFound if other_company_attendance?

      @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:year]).order(created_at: "DESC")
      @years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
      if @attendance.client_feed_backs.exists?(attendance_id: @attendance.id, year: params[:year], month: params[:month])
        @client_feed_back = @attendance.client_feed_backs.find_by(attendance_id: params[:attendance_id], year: params[:year], month: params[:month])
        redirect_to complete_companies_attendance_client_feed_back_path(@client_feed_back, attendance_id: @attendance.id, year: @client_feed_back.year, month: @client_feed_back.month)
      else
        @client_feed_back = ClientFeedBack.new
      end
    end

    def create
      @attendance = Attendance.find(params[:attendance_id])
      raise ActiveRecord::RecotdNotFound if other_company_attendance?

      @client_feed_back = @attendance.client_feed_backs.build(client_feed_back_params)
      if @client_feed_back.save
        redirect_to complete_companies_attendance_client_feed_back_path(@client_feed_back, attendance_id: @attendance.id, year: @client_feed_back.year, month: @client_feed_back.month, user_id: params[:client_feed_back][:user_id])
      else
        params[:user_id] = params[:client_feed_back][:user_id]
        params[:year] = params[:client_feed_back][:year]
        params[:month] = params[:client_feed_back][:month]
        @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:year]).order(created_at: "DESC")
        @years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
        @proposition_contracts = @attendance.user.proposition_contracts.order(created_at: "DESC")
        render :new
      end
    end

    def complete
      @attendance = Attendance.find(params[:attendance_id])
      raise ActiveRecord::RecotdNotFound if other_company_attendance?

      @years = @attendance.monthly_unit_prices.order(year: "ASC").map { |x| [x.year, x.month] }.uniq(&:first)
      @monthly_unit_prices = @attendance.monthly_unit_prices.where(year: params[:year]).order(created_at: "DESC")
      @client_feed_back = @attendance.client_feed_backs.find_by(attendance_id: params[:attendance_id], year: params[:year],  month: params[:month])
      @feed_back = @attendance.feed_backs.find_by(attendance_id: params[:attendance_id], year: params[:year],  month: params[:month])
    end

    private
      def client_feed_back_params
        params.require(:client_feed_back).permit(:year,
                                                 :month,
                                                 :within_time,
                                                 :achieved,
                                                 :communication,
                                                 :partner_skills,
                                                 :interview,
                                                 :request,
                                                 :attendance_id)
      end

      def other_company_attendance?
        @attendance.proposition.company != current_company
      end
  end
end
