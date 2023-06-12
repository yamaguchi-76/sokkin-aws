# frozen_string_literal: true

module Users
  class EducationalBackgroundsController < Users::ApplicationController
    before_action :set_educational_background, only: %i[show edit]
    def show; end

    def edit; end

    def update
      @educational_background = current_user.educational_background
      after_updated_path = @educational_background.ever_updated? ? users_educational_backgrounds_path : edit_users_employment_statuses_path
      if @educational_background.update(educational_background_params.merge(update_count: 1)) # 現状0or1しか見ていないため一律で1にする
        redirect_to after_updated_path
      else
        render :edit
      end
    end

    private
      def educational_background_params
        params.require(:educational_background)
              .permit(:recent_academic_history,
                      :school_name,
                      :faculty_name,
                      :graduated_year)
      end

      def set_educational_background
        @educational_background = EducationalBackground.find_or_create_by(user: current_user)
      end
  end
end
