# frozen_string_literal: true

class ScoutMailer < ApplicationMailer
  def scout(scout)
    @user = scout.user
    @proposition = scout.proposition
    mail to: @user.email, subject: "スカウトが届きました！"
  end
end
