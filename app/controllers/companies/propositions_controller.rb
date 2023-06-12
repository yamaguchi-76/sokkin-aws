# frozen_string_literal: true

module Companies
  class PropositionsController < Companies::ApplicationController
    # GET /companies/propositions
    def index
      @q = Proposition.where(company: current_company)
                      .ransack(params[:q])
      @propositions = @q.result(distinct: true)
    end

    # GET /companies/propositions/1
    def show
      @proposition = Proposition.find_by!(id: params[:id], company: current_company)
    end

    # GET /companies/propositions/new
    def new
      @proposition = Proposition.new
    end

    # GET /companies/propositions/confirm
    def confirm
      @proposition = current_company.propositions.build(proposition_params)
      render :new if @proposition.invalid?
    end

    # POST /companies/propositions
    def create
      @proposition = current_company.propositions.build(proposition_params.merge(status: :draft))

      render :new and return if params[:back]

      if @proposition.save
        redirect_to companies_propositions_path, notice: "Proposition was successfully created."
      else
        render :new
      end
    end

    private
      def proposition_params
        params.require(:proposition).permit(:industry_id,
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
                                            :image_cache,
                                            job_kind_ids: [],
                                            work_range_ids: [],
                                            work_condition_ids: [])
      end
  end
end
