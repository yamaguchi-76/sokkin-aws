# frozen_string_literal: true

module Users
  class PropositionFavoritesController < ApplicationController
    # POST /users/propositions/:proposition_id/favorites
    def create
      proposition = Proposition.find(params[:proposition_id])
      current_user.favorites.create!(proposition: proposition)
      redirect_to request.referer, success: t(".success")
    end

    # DELETE /users/propositions/:proposition_id/favorites/:id
    def destroy
      current_user.favorites.find(params[:id]).destroy!
      redirect_to request.referer, success: t(".success")
    end
  end
end
