require 'will_paginate/array'

class GamenightsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_gamenight, only: [:show, :edit, :update, :destroy]
  before_action :send_cancelation, only: :destroy


  def index
    @gamenights_index = futur_gamenights.paginate(page: params[:page], per_page: 2)

    @gamenight_geocoded = Location.geocoded.map do |location|
      location.gamenights
    end.flatten
      if params[:query].present?
     boardgames= Boardgame.search_by_name_and_category(params[:query])
      @gamenight_geocoded = @gamenight_geocoded.filter do |gamenight|
        boardgames.include?(gamenight.boardgame)
      end
    end

    @markers = @gamenight_geocoded.map do |gamenight|
      {
        lat: gamenight.location.latitude,
        lng: gamenight.location.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { gamenight: gamenight }),
        image_url: helpers.asset_url('avatar.png')
      }

    end
  end

  def show
    @boardgame = @gamenight.boardgame
    @location = @gamenight.location
    @user = @boardgame.user
    @participations = @gamenight.participations


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
    @locations_user = current_user.locations
    @boardgames_user = current_user.boardgames
  end

  def update
    if @gamenight.update(gamenight_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @gamenight.destroy

    redirect_to dashboard_path
  end

  private

  def send_cancelation
    GamenightMailer.send_cancelation_notice(@gamenight)
  end

  def futur_gamenights
    @gamenights = Gamenight.all
    gamenights_display = @gamenights.select do |gamenight|
      gamenight if ((gamenight.date > Time.now.to_date) && (gamenight.boardgame.players_max > gamenight.participations.size)) || ((gamenight.date == Time.now.to_date) && (gamenight.start_time.hour - 2 >= Time.now.hour) && (gamenight.boardgame.players_max > gamenight.participations.size))
    end
    return gamenights_display.sort_by { |gamenight| gamenight.date }
  end

  def find_gamenight
    @gamenight = Gamenight.find(params[:id])
  end

  def gamenight_params
    params.require(:gamenight).permit(:date, :start_time, :end_time, :description, :boardgame_id, :location_id)
  end
end
