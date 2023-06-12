# frozen_string_literal: true

module Admins
  class ScoutsController < Admins::ApplicationController
    def index
      @scouts = Scout.all.order(id: :desc)
    end

    def new
      @propositions = Proposition.wanted
      @users = User.all
      @scout = Scout.new
    end

    def create
      # NOTE: save失敗は重複登録のみなのでロールバックせず、画面にエラーを出さず成功させる
      scout_params[:user_id].compact_blank.each do |user_id|
        Scout.send_scout(proposition_id: scout_params[:proposition_id],
                         user_id: user_id,
                         from: :admin)
      end

      redirect_to admins_scouts_path
    end

    private
      def scout_params
        params.require(:scout).permit(:proposition_id,
                                      user_id: [])
      end
  end
end
