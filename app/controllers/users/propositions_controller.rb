# frozen_string_literal: true

module Users
  class PropositionsController < Users::ApplicationController
    before_action :must_be_completed_initial_setting, only: %i[entry_form entry]

    # GET /users/propositions
    def index
      @q = Proposition.deadline_after_today
                      .enterable(current_user)
                      .ransack(params[:q])
                      
      @propositions = @q.result(distinct: true).page(params[:page])

      @favorite_propositions = Proposition.joins(:favorites)
                                          .deadline_after_today
                                          .enterable(current_user)
                                          .merge(UserPropositionFavorite.where(user: current_user))

      @scout_propositions = Proposition.joins(:scouts)
                                       .deadline_after_today
                                       .enterable(current_user)
                                       .merge(Scout.consider.where(user: current_user))
    end

    # GET /users/propositions/1
    def show
      @proposition = Proposition.entried(current_user)
                                .or(Proposition.enterable(current_user))
                                .find(params[:id])
      @proposition_entry = @proposition.proposition_entries.find_by(user: current_user)
    end

    # GET /users/propositions/1/entry_form
    def entry_form
      @proposition = Proposition.enterable(current_user).find(params[:id])
      @proposition_entry = PropositionEntry.new
    end

    # POST /users/propositions/1/entry
    def entry
      @proposition = Proposition.enterable(current_user).find(params[:id])

      @proposition_entry = current_user.proposition_entries.new(proposition_entry_params.merge(status: :before_interview, proposition: @proposition))
      if @proposition_entry.save
        update_scout
        send_mail
        redirect_to complete_users_proposition_path(@proposition.id), notice: "応募完了しました。"
      else
        flash[:error] = @proposition_entry.errors.full_messages.join
        render :entry_form
      end
    end

    # GET /users/propositions/1/complete
    def complete
    end

    private
      def proposition_entry_params
        params.require(:proposition_entry)
              .permit(:estimated_work_time,
                      :request)
      end

      def update_scout
        scout = Scout.consider.find_by(proposition: @proposition, user: current_user)
        scout.update(status: :entried) if scout
      end

      def send_mail
        PropositionEntryMailer.complete_entry(current_user, @proposition).deliver
      end

      def must_be_completed_initial_setting
        return if current_user.initial_setting_completed?

        redirect_to users_need_initial_setting_path
      end
  end
end
