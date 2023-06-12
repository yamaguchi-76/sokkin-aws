# frozen_string_literal: true

class RegistrationMailer < ApplicationMailer
  def send_when_signup(user, resource)
    @user = user
    mail to: @user[:email], subject: "テストです。"
  end
end
