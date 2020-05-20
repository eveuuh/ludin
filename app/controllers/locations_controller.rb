class LocationsController < ApplicationController
  before_action :find_location, only: [:edit, :update, :destroy]

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    authorize @location

    if @location.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @location.update(location_params)

    redirect_to dashboard_path
  end

  def destroy
    @location.delete

    redirect_to dashboard_path
  end

  private

  def find_location
    @location = policy_scope(Location).find(params[:id])
    authorize @location
  end

  def location_params
    params.require(:location).permit(:name, :address)
  end
end
