# frozen_string_literal: true

module Users
  class ApplicationController < ApplicationController
    layout "layouts/users/application/"

    before_action :authenticate_user!

    unless Rails.env.development?
      rescue_from StandardError, with: :_render_404
    end

    private
      def _render_404(e = nil)
        logger.info "[users] Rendering 404 with exception: #{e.message}" if e

        render "errors/users/404.html", status: :not_found
      end
  end
end
