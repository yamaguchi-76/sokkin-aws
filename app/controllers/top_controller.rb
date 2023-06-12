# frozen_string_literal: true

class TopController < ApplicationController
  def index
    if Rails.env.production?
      redirect_to "https://sokkin-match.me/partner"
    end
  end
end
