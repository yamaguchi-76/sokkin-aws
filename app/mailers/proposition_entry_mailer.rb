# frozen_string_literal: true

class PropositionEntryMailer < ApplicationMailer
  def complete_entry(user, proposition)
    @user = user
    @proposition = proposition
    mail to: @user.email, subject: "応募が完了しました"
  end
end
