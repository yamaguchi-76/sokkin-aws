# frozen_string_literal: true

module Companies
  class ApplicationController < ApplicationController
    layout "layouts/companies/application/"

    before_action :authenticate_company!

    unless Rails.env.development?
      rescue_from StandardError, with: :_render_404
    end

    private
      def _render_404(e = nil)
        logger.info "[companies] Rendering 404 with exception: #{e.message}" if e

        render "errors/companies/404.html", status: :not_found
      end
  end
end
