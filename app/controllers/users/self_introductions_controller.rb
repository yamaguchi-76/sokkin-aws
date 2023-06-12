# frozen_string_literal: true

module Users
  class SelfIntroductionsController < Users::ApplicationController
    before_action :set_self_introduction, only: %i[show edit]

    def show; end

    def edit; end

    def update
      @self_introduction = current_user.self_introduction
      if @self_introduction.update(self_introduction_params.merge(update_count: 1)) # 現状0or1しか見ていないため一律で1にする
        redirect_to users_self_introductions_path
      else
        render :edit
      end
    end

    private
      def self_introduction_params
        params.require(:self_introduction)
              .permit(:self_pr,
                      :desired_unit_price,
                      :desired_working_hours,
                      :desired_working_days,
                      :in_person_meeting,
                      :handle_status,
                      :handle_conditions,
                      :portfolio,
                      :registered_invoice,
                      :invoice_number)
      end

      def set_self_introduction
        @self_introduction = SelfIntroduction.find_or_create_by(user: current_user)
      end
  end
end
