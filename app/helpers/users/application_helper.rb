# frozen_string_literal: true

module Users
  module ApplicationHelper
    def first_sign_in?
      current_user.sign_in_count == 1
    end
  end
end
