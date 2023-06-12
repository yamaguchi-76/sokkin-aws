# frozen_string_literal: true

module Users
  class DoubleJobExperiencesController < Users::ApplicationController
    def show
      @double_job_experiences = current_user.double_job_experiences
    end

    def bulk_edit; end

    def bulk_update
      update_params = double_job_experiences_params[:second_job_experience] ? double_job_experiences_params : { second_job_experience: false }
      after_updated_path = current_user.double_job_experiences.present? ? users_double_job_experiences_path : edit_users_self_introductions_path
      if current_user.update(update_params)
        redirect_to after_updated_path
      else
        render :bulk_edit
      end
    end

    private
      def double_job_experiences_params
        params.require(:user)
              .permit(:second_job_experience,
                      double_job_experiences_attributes: [:id,
                                                          :company_name,
                                                          :faculty_name,
                                                          :job_kind_id,
                                                          :monthly_income,
                                                          :working_hours,
                                                          :employment_start_date,
                                                          :employment_end_date,
                                                          :business_experience,
                                                          :_destroy])
      end
  end
end
