# frozen_string_literal: true

module Admins
  class UsersController < ApplicationController
    # GET /admins/users
    def index
      @form = UserSearchForm.new(search_params)
      @users = @form.search
    end

    # GET /admins/users/1
    def show
      @user = User.find(params[:id])
    end

    def export_csv
      @users = User.left_joins(:educational_background,
                               :employment_status,
                               :past_employment_statuses,
                               :double_job_experiences,
                               :self_introduction,
                               :skill).all.distinct
      @maximum_past_employment_status_count = PastEmploymentStatus.group(:user_id).count.values.max || 0
      @maximum_double_job_experience_count = DoubleJobExperience.group(:user_id).count.values.max || 0
    end

    def destroy
      @user = User.find(params[:id])
      @user.soft_delete
      redirect_to admins_users_path, notice: "ユーザー退会完了しました"
    end

    private
      def search_params
        params.fetch(:user_search_form, {})
              .permit(:age_gteq,
                      :age_lteq,
                      :desired_unit_price_gteq,
                      :desired_unit_price_lteq,
                      :desired_working_days_gteq,
                      :desired_working_days_lteq,
                      :desired_working_hours_gteq,
                      :desired_working_hours_lteq,
                      handle_conditions: [],
                      handle_statuses: [],
                      employment_statuses: [],
                      job_kind_ids: [],
                      skills: [])
      end
  end
end
