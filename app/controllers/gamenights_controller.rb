class GamenightsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_gamenight, only: [:show, :edit, :update, :destroy]

  def index
    @gamenights = Gamenight.all
  end

  def show
    @boardgame = @gamenight.boardgame
    @location = @gamenight.location
    @user = @boardgame.user
  end

  def new
    @gamenight = Gamenight.new
    @locations_user = current_user.locations
    @boardgames_user = current_user.boardgames
  end

  def create
    @gamenight = Gamenight.new(gamenight_params)
    if @gamenight.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @gamenight.update(gamenight_params)

    redirect_to dashboard_path
  end

  def destroy
    @gamenight.delete

    redirect_to dashboard_path
  end

  private

  def find_gamenight
    @gamenight = Gamenight.find(params[:id])
  end

  def gamenight_params
    params.require(:gamenight).permit(:date, :start_time, :end_time, :description, :boardgame_id, :location_id)
  end
end
