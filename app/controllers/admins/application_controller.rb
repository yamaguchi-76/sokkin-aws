# frozen_string_literal: true

module Admins
  class ApplicationController < ApplicationController
    before_action :authenticate_admin!

    unless Rails.env.development?
      rescue_from StandardError, with: :_render_404
    end

    private
      def _render_404(e = nil)
        logger.info "[admins] Rendering 404 with exception: #{e.message}" if e

        render "errors/admins/404.html", status: :not_found
      end
  end
end
