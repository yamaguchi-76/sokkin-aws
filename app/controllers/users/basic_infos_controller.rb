# frozen_string_literal: true

module Users
  class BasicInfosController < Users::ApplicationController
    def show; end

    def edit; end

    def update
      after_updated_path = current_user.ever_updated? ? users_basic_infos_path : edit_users_educational_backgrounds_path
      if current_user.update(basic_info_params)
        redirect_to after_updated_path
      else
        render :edit
      end
    end

    private
      def basic_info_params
        params.require(:user)
              .permit(:last_name,
                      :first_name,
                      :last_name_kana,
                      :first_name_kana,
                      :gender,
                      :birthday,
                      :phone_number,
                      :postal_code,
                      :address,
                      :image)
      end
  end
end
