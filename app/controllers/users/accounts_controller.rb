# frozen_string_literal: true

module Users
  class AccountsController < Users::ApplicationController
    def show
      @bank_account = BankAccount.find_or_create_by(user: current_user)
    end
  end
end
