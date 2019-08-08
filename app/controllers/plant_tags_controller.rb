class PlantTagsController < ApplicationController
  def new
    # raise
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new(plant_tags_strong_params)
    @plant_tag.plant = @plant
    if @plant_tag.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def destroy
    @plant_tag = PlantTag.find(params[:id])
    @plant_tag.destroy
    redirect_to plant_path(@plant_tag.plant)
  end

  private


  def plant_tags_strong_params
    params.require(:plant_tag).permit(:description, :tag_id)
  end
end

# plant_tag DELETE /plant_tags/:id(.:format)                                                                plant_tags#destroy
