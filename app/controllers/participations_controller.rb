class ParticipationsController < ApplicationController
  before_action :find_participation, only: [:edit, :update, :destroy]
  before_action :send_cancelation_notice, only: :destroy
  after_action :send_review_notification, only: :update
  after_action :send_write_review, only: :create


  def create
    @participation = Participation.new
    authorize @participation

    @gamenight = policy_scope(Gamenight).find(params[:gamenight_id])
    @participation.gamenight = @gamenight
    @participation.user = current_user
    @time = ((@gamenight.date.to_time - Date.today.to_time)/3600) + 48

    if @participation.save
      redirect_to dashboard_path
    else
      render 'gamenights/show'
    end
  end

  def edit; end

  def update
    if @participation.update(participation_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @participation.delete

    redirect_to dashboard_path
  end

  private

  def send_review_notification
    ReviewMailer.with(participation: self).review_notification(@participation).deliver_now
  end

  def send_write_review
    ReviewMailer.write_review(@participation).deliver_later(wait_until: @time.hours.from_now)
  end

  def send_cancelation_notice
    ParticipationMailer.with(participation: self).cancelation_notice(@participation).deliver_now
  end

  def find_participation
    @participation = policy_scope(Participation).find(params[:id])
    authorize @participation
  end

  def participation_params
    params.require(:participation).permit(:rating, :description)
  end
end
