class BoardgamesController < ApplicationController
  before_action :find_boardgame, only: [:edit, :update, :destroy]

  def new
    @boardgame = Boardgame.new
    authorize @boardgame
  end

  def create
    @boardgame = Boardgame.new(boardgame_params)
    @boardgame.user = current_user
    authorize @boardgame

    if @boardgame.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @boardgame.update(boardgame_params)

    redirect_to dashboard_path
  end

  def destroy
    @boardgame.destroy

    redirect_to dashboard_path
  end

  private

  def find_boardgame
    @boardgame = policy_scope(Boardgame).find(params[:id])
    authorize @boardgame
  end

  def boardgame_params
    params.require(:boardgame).permit(:name, :category, :age, :players_min, :players_max, :description, :photo)
  end
end
