# frozen_string_literal: true

module Companies
  class RegistrationsController < Devise::RegistrationsController
    layout "layouts/companies/application/"

    before_action :not_allowed_actions!, only: %i[cancel new destroy create]
    # before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # rubocop:disable Metrics/AbcSize
    # PUT /resource
    def update
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      resource_updated = update_resource(resource, configure_account_update_params)
      yield resource if block_given?

      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

        redirect_to companies_account_path
      else
        clean_up_passwords resource
        set_minimum_password_length
        render :edit
      end
    end
    # rubocop:enable Metrics/AbcSize

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected
      def update_resource(resource, params)
        resource.update_without_current_password(params)
      end

      # If you have extra params to permit, append them to the sanitizer.
      # def configure_sign_up_params
      #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
      # end

      # If you have extra params to permit, append them to the sanitizer.
      def configure_account_update_params
        params.require(:company)
              .permit(:email,
                      :password,
                      :password_confirmation,
                      :name,
                      :name_kana,
                      :homepage,
                      :postal_code,
                      :address,
                      :belonging_department,
                      :person_in_charge_last_name,
                      :person_in_charge_last_name_kana,
                      :person_in_charge_first_name,
                      :person_in_charge_first_name_kana,
                      :phone_number)
      end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    private
      # NOTE: toBはadminからのみ登録を許容する
      def not_allowed_actions!
        raise ActionController::RoutingError
      end
  end
end
