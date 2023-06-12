# frozen_string_literal: true

module Companies
  class ScoutsController < Companies::ApplicationController
    def new
      @user = User.active.find(params[:user_id])
      @propositions = Proposition.scoutable(@user, current_company)
      @scout = Scout.new
    end

    def create
      @user = User.active.find(params[:user_id])
      Scout.send_scout(proposition_id: scout_params[:proposition_id],
                       user_id: @user.id,
                       from: :company)

      redirect_to complete_companies_user_scouts_path(@user.id)
    end

    def complete; end

    private
      def scout_params
        params.require(:scout).permit(:proposition_id)
      end
  end
end
