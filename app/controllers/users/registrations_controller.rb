# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    layout "layouts/users/application/"

    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
      super
    end

    # POST /resource
    def create
      super
    end

    # GET /resource/edit
    def edit
      super
    end

    # rubocop:disable Metrics/AbcSize
    def update
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      resource_updated = update_resource(resource, configure_account_update_params)
      yield resource if block_given?
      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

        redirect_to users_account_path
      else
        clean_up_passwords resource
        set_minimum_password_length
        render :edit
      end
    end
    # rubocop:enable Metrics/AbcSize

    def completion; end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    def destroy
      super
      # NOTE: toCユーザーが自ら退会する機能の場合、以下の処理を行う
      # resource.soft_delete
      # Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      # set_flash_message! :notice, :destroyed
      # yield resource if block_given?
      # respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    end

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

      def after_update_path_for(_resource)
        edit_user_registration_path
      end

      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[email agreement])
      end

      def configure_account_update_params
        params.require(:user)
              .permit(:email,
                      :password,
                      :password_confirmation)
      end

      # def after_sign_up_path_for(resource)
      #   completion_path
      # end

      def after_confirmation_path_for(resource_name, resource)
        sign_in(resource)
        user_registration_path
      end

      def after_inactive_sign_up_path_for(resource)
        users_completion_path
      end
  end
end
