class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new

    @gamenight = Gamenight.find(params[:gamenight_id])
    @participation.gamenight= @gamenight
    @participation.user = current_user

    if @participation.save
      redirect_to dashboard_path
    else
      render 'gamenights/show'
    end
  end

  def edit
    @participation = Participation.find(params[:id])
  end

  def update
    @participation = Participation.find(params[:id])

    @participation.update
    redirect_to dashboard_path
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.delete

    redirect_to dashboard_path
  end

  private

  def participation_params
    params.require(:participation).permit(:rating, :description)
  end
end
