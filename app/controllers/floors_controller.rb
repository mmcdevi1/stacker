class FloorsController < ApplicationController
  
  def create
    @building = Building.find(params[:building_id])
    @floor = @building.floors.new(floors_params)
    @floor.user = current_user
    if @floor.save
      flash[:success] = "Floor created."
      redirect_to building_path(@building)
    else
      render 'new'
    end
  end

  private
  def floors_params
    params.require(:floor).permit(:user_id, :building_id, :tenant, :sf, :floor)
  end
end
