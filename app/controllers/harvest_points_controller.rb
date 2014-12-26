class HarvestPointsController < ApplicationController
  before_action :current_wall, except: [:destroy, :edit]

  def new
  	@point= @wall.harvest_points.build
  end

  def create
  	@point= @wall.harvest_points.new(harvest_params)
    
    if @point.save
      redirect_to pic_path(@wall)
    else
      render :new
    end 
  end


  def edit
  	@point = HarvestPoint.find(params[:id])
  	@point.update(updated_at: Time.current)
  	@point.update(status: 1)

  	redirect_to pic_path(@point.plant_wall)

  end

  def update

  end

  private
    def current_wall
      @wall = PlantWall.find(params[:plant_wall_id])
    end

    def harvest_params
      params.require(:harvest_point).permit(:breed)	
    end
end
