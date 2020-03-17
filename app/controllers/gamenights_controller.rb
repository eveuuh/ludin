class GamenightsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @gamenights = Gamenight.all
  end

  def show
    @gamenight = Gamenight.find(params[:id])
    @boardgame = @gamenight.boardgame
    @location = @gamenight.location
    @user = @boardgame.user
  end
end
