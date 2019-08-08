class PlantsController < ApplicationController
  def new
    # raise
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def create
    # raise
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new(plant_strong_params)
    @plant.garden = @garden
    # @plant.garden_id = @garden.id
    if @plant.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to garden_path(@plant.garden_id)
  end


  private

  def plant_strong_params
    params.require(:plant).permit(:name, :image_url)
  end
end
