# frozen_string_literal: true

module Companies
  class UsersController < Companies::ApplicationController
    # GET /companies/users
    def index
      @form = UserSearchForm.new(search_params)
      @users = @form.search.active
    end

    # GET /companies/users/1
    def show
      @user = User.active.find(params[:id])
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
