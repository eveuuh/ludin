class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def uikit
  end

  def dashboard
    @user = current_user
    # @my_boardgames = current_user.boardgames
    # @my_gamenights = current_user.gamenights
    # @my_locations = current_user.locations
    # @my_participations = current_user.participations
  end
end

rails g model Boardgame name category players_min:integer players_max:integer age description:text user:references

rails g model Location name address longitude:integer latitude:integer user:references # integer pour lon & lat ???

rails g model Gamenight date:date start_time:time end_time:time description:text location:references boardgame:references

rails g model Participation rating:integer description:text user:references gamenight:references
