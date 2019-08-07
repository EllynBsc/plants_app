class GardensController < ApplicationController
  def show
    # raise
    @garden = Garden.find(params[:id])
  end
end
