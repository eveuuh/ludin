class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home,:uikit, :dashboard]

  def home
  end

  def uikit
  end

  def dashboard
    @user = current_user
    @my_boardgames = current_user.boardgames
    @my_gamenights = current_user.gamenights
    @my_locations = current_user.locations
    @my_participations = current_user.participations
  end
end
