# frozen_string_literal: true

module Users
  class ScoutsController < Users::ApplicationController
    # PATCH /users/scouts/:id/not_interested
    def not_interested
      proposition = Proposition.find(params[:id])
      @scout = current_user.scouts.find_by!(proposition: proposition)
      @scout.update(status: :not_interested)
      redirect_to request.referer
    end
  end
end
