# frozen_string_literal: true

module Admins
  class CompaniesController < ApplicationController
    before_action :set_admins_company, only: [:show, :edit, :update, :destroy]

    # GET /admins/companies
    def index
      @companies = Company.all
    end

    # GET /admins/companies/1
    def show
    end

    # GET /admins/companies/new
    def new
      @company = Company.new
    end

    # GET /admins/companies/1/edit
    def edit
    end

    # POST /admins/companies
    def create
      @company = Company.new(company_params)

      if @company.save
        redirect_to admins_companies_path, notice: "Company was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /admins/companies/1
    def update
      if @company.update(company_params)
        redirect_to admins_company_path(@company.id), notice: "Company was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /admins/companies/1
    def destroy
      @company.destroy
      redirect_to admins_companies_url, notice: "Company was successfully destroyed."
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name,
                                      :name_kana,
                                      :phone_number,
                                      :person_in_charge_last_name,
                                      :person_in_charge_last_name_kana,
                                      :person_in_charge_first_name,
                                      :person_in_charge_first_name_kana,
                                      :belonging_department,
                                      :address,
                                      :postal_code,
                                      :homepage,
                                      :email,
                                      :password)
    end
  end
end
