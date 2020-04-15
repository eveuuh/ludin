class ParticipationsController < ApplicationController
  before_action :find_participation, only: [:edit, :update, :destroy]
  before_action :send_cancelation_notice, only: :destroy

  def create
    @participation = Participation.new

    @gamenight = Gamenight.find(params[:gamenight_id])
    @participation.gamenight = @gamenight
    @participation.user = current_user

    if @participation.save
      redirect_to dashboard_path
    else
      render 'gamenights/show'
    end
  end

  def edit
  end

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

  def send_cancelation_notice
    ParticipationMailer.with(participation: self).cancelation_notice.deliver_now
  end

  def find_participation
    @participation = Participation.find(params[:id])
  end

  def participation_params
    params.require(:participation).permit(:rating, :description)
  end
end
