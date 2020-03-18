class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :uikit, :dashboard]

  def home
  end

  def uikit
  end

  def dashboard
    @user = current_user
    @my_boardgames = current_user.boardgames
    @my_locations = current_user.locations
    @my_participations = current_user.participations
    @owners = owner_gamenights
    @participants = participant_gamenights
  end

  private

  def owner_gamenights
    gamenights = @my_boardgames.map { |boardgame| boardgame.gamenights }
    return gamenights
  end

  def participant_gamenights
    gamenights = @my_participations.map { |participation| participation.gamenight }
    return gamenights
  end
end
