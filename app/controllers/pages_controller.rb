require 'will_paginate/array'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :uikit]

  def home
  end

  def uikit
  end

  def profil
    @user = User.find(params[:user_id])
    @user_boardgames = @user.boardgames
    @user_full_gamenights = full_gamenights_profil
    @user_futur_gamenights = owner_gamenights_profil
    @full_participations_to_user_gamenights = owner_gamenights_participations_profil

    @reviews_profil = @full_participations_to_user_gamenights.paginate(page: params[:reviews_page], per_page: 2)
    @gamenights_profil = @user_futur_gamenights.paginate(page: params[:gamenights_page], per_page: 2)
  end

  def dashboard
    @user = current_user
    @my_boardgames = current_user.boardgames
    @my_locations = current_user.locations
    @my_participations = current_user.participations.sort_by { |participation| participation.gamenight.date }.reverse
    @my_gamenights = owner_gamenights_dahsboard

    @gamenights_dashboard = @my_gamenights.paginate(page: params[:gamenights_page], per_page: 2)
    @participations_dashboard = @my_participations.paginate(page: params[:participations_page], per_page: 2)

    @futur_gamenights_counter = owner_futur_gamenights_counter_dahsboard
    @futur_participations_counter = current_user.participations.select { |participation| participation if participation.gamenight.date >= Time.now.to_date }.size
  end

  private

  def owner_gamenights_dahsboard
    gamenights = []
    @my_boardgames.each do |boardgame|
      boardgame.gamenights.each do |gamenight|
        gamenights << gamenight
      end
    end
    return gamenights.sort_by { |gamenight| gamenight.date }.reverse
  end

  def owner_futur_gamenights_counter_dahsboard
    gamenights = []
    @my_boardgames.each do |boardgame|
      boardgame.gamenights.each do |gamenight|
        gamenights << gamenight if gamenight.date >= Time.now.to_date
      end
    end
    return gamenights.size
  end

  def owner_gamenights_profil
    gamenights = []
    @user_boardgames.each do |boardgame|
      boardgame.gamenights.each do |gamenight|
        gamenights << gamenight if gamenight.date >= Time.now.to_date
      end
    end
    return gamenights.sort_by { |gamenight| gamenight.date } # trie par date de la + proche à la + eloignee
  end

  def full_gamenights_profil
    gamenights = []
    @user_boardgames.each do |boardgame|
      boardgame.gamenights.each do |gamenight|
        gamenights << gamenight
      end
    end
    return gamenights.sort_by { |gamenight| gamenight.date }.reverse # trie par date de la + eloignee à la + proche
  end

  def owner_gamenights_participations_profil
    participations = []
    @user_full_gamenights.each do |gamenight|
      gamenight.participations.each do |participation|
        participations << participation if (participation.user != participation.gamenight.boardgame.user) && (!participation.rating.nil?)
      end
    end
    # @user_full_gamenights est deja trier par date
    return participations
  end
end
