class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    @buildings = current_user.buildings.all
  end

  def show
  end

  def edit
  end

  def new
    @building = current_user.buildings.new
  end

  def create
    @building = current_user.buildings.new(buildings_params)
    if @building.save
      flash[:success] = "Property created."
      redirect_to @building 
    else 
      render 'new'
    end
  end

  def update
  end

  def destroy
    @building.destroy
    redirect_to :back
    flash[:success] = "Property deleted."
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end

  def buildings_params
    params.require(:building).permit(:name, :user_id, :floors, :sf)
  end
end
