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
    # @gamenight_user = @participation.gamenight.boardgame.user
    # @global_rating = @gamenight_user.global_rating

    # @ratings = []
    # @all_user_gamenights = @gamenight_user.boardgames.map { |boardgame| boardgame.gamenights }
    # @all_user_gamenights.each do |gamenights|
    #   gamenights.each do |gamenight|
    #     gamenight.participations.each do |participation|
    #       @ratings << participation.rating if participation.rating
    #     end
    #   end
    # end

    if @participation.update(participation_params)
      # @ratings << @participation.rating
      # @global_rating = (@ratings.sum).to_f / (@ratings.size)
      # @gamenight_user.global_rating = @global_rating
      redirect_to dashboard_path
    else
      render :edit
    end
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
