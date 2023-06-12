# frozen_string_literal: true

module Users
  class BankAccountsController < Users::ApplicationController
    def edit
      @bank_account = BankAccount.find_or_create_by(user: current_user)
    end

    def update
      @bank_account = BankAccount.find_by!(user: current_user)
      if @bank_account.update(bank_account_params)
        redirect_to users_account_path
      else
        redirect_to edit_user_registration_path
      end
    end


    private
      def bank_account_params
        params.require(:bank_account)
              .permit(:bank_name,
                      :branch_name,
                      :account_kind,
                      :account_number,
                      :account_holder)
      end
  end
end
