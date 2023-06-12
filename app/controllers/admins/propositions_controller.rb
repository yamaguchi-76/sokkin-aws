# frozen_string_literal: true

module Admins
  class PropositionsController < ApplicationController
    before_action :set_proposition, only: [:show, :edit, :update, :destroy]

    # GET /admins/propositions
    def index
      @propositions = Proposition.joins(:company).all
    end

    # GET /admins/propositions/1
    def show
      @proposition_entries = PropositionEntry.left_joins(user: :educational_background)
                                             .where(proposition_id: params[:id])
    end

    # GET /admins/propositions/new
    def new
      @proposition = Proposition.new
    end

    # GET /admins/propositions/1/edit
    def edit
    end

    # POST /admins/propositions
    def create
      @proposition = Proposition.new(proposition_params)

      if @proposition.save
        redirect_to admins_propositions_path, notice: "Proposition was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /admins/propositions/1
    def update
      if @proposition.update(proposition_params)
        redirect_to admins_proposition_path(@proposition.id), notice: "Proposition was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /admins/propositions/1
    def destroy
      @proposition.destroy
      redirect_to admins_propositions_url, notice: "Proposition was successfully destroyed."
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposition
      @proposition = Proposition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proposition_params
      params.require(:proposition).permit(:company_id,
                                          :industry_id,
                                          :title,
                                          :detail,
                                          :amount,
                                          :estimated_work_time_from,
                                          :estimated_work_time_to,
                                          :operation_start_at,
                                          :contract_period,
                                          :environment,
                                          :industry,
                                          :background,
                                          :required_skill,
                                          :welcome_skill,
                                          :work_order,
                                          :ng_point,
                                          :note,
                                          :unit_price,
                                          :unit_price_per_hour,
                                          :application_deadline,
                                          :image,
                                          :status,
                                          job_kind_ids: [],
                                          work_range_ids: [],
                                          work_condition_ids: [])
    end
  end
end
