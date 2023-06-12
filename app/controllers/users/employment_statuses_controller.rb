# frozen_string_literal: true

module Users
  class EmploymentStatusesController < Users::ApplicationController
    before_action :set_employment_status, only: %i[show edit]

    def show
      @past_employment_statuses = current_user.past_employment_statuses
    end

    def edit; end

    def update
      after_updated_path = current_user.employment_status.ever_updated? ? users_employment_statuses_path : users_double_job_experiences_edit_path


      result = current_user.employment_status.update(employment_status_params[:employment_status].merge(update_count: 1)) # 現状0or1しか見ていないため一律で1にする
      if past_employment_status_params[:past_employment_statuses_attributes].present?
        result = current_user.update(past_employment_status_params)
      end

      if result
        redirect_to after_updated_path
      else
        render :edit
      end
    end

    private
      def employment_status_params
        params.require(:user).permit(employment_status: [:status,
                                                         :company_name,
                                                         :industry_category,
                                                         :job_kind_id,
                                                         :job_title,
                                                         :yearly_income,
                                                         :working_hours,
                                                         :working_days_of_the_week,
                                                         :business_experience,
                                                         :employment_start_date,
                                                         :employment_end_date,
                                                         :in_employment])
      end

      def past_employment_status_params
        params.require(:user).permit(past_employment_statuses_attributes: [:id,
                                                                           :company_name,
                                                                           :previous_client_or_industry,
                                                                           :employment_start_date,
                                                                           :employment_end_date,
                                                                           :_destroy])
      end

      def set_employment_status
        @employment_status = EmploymentStatus.find_or_create_by(user: current_user)
      end
  end
end
