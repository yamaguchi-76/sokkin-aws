# frozen_string_literal: true

module Companies
  class PasswordsController < Devise::PasswordsController
    # GET /resource/password/new
    # def new
    #   super
    # end

    # POST /resource/password
    # def create
    #   super
    # end

    # GET /resource/password/edit?reset_password_token=abcdef
    # def edit
    #   super
    # end

    # PUT /resource/password
    # rubocop:disable Metrics/AbcSize
    def update
      self.resource = resource_class.reset_password_by_token(resource_params)
      yield resource if block_given?

      if resource.errors.empty?
        resource.unlock_access! if unlockable?(resource)
        if Devise.sign_in_after_reset_password
          flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
          set_flash_message!(:notice, flash_message)
          resource.after_database_authentication
          # sign_in(resource_name, resource)
        else
          set_flash_message!(:notice, :updated_not_active)
        end
        respond_with resource, location: after_resetting_password_path_for(resource)
      else
        set_minimum_password_length
        respond_with resource
      end
    end
    # rubocop:enable Metrics/AbcSize

    def sent_reset_password; end

    def completion_reset_password; end

    protected
      def after_resetting_password_path_for(resource)
        companies_completion_reset_password_path
      end

      # The path used after sending reset password instructions
      def after_sending_reset_password_instructions_path_for(resource_name)
        companies_sent_reset_password_path
      end
  end
end
