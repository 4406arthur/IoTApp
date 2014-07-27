class PlantWallsController < ApplicationController
  before_action :current_user, only: [:new, :create ]
  before_action :current_wall, only: [:edit,:update,:destroy]
  def index
  end

  def show
  end

  def new
  	@plantwall= @user.plant_walls.build
  end

  def create
  	@plantwall= @user.plant_walls.new(plant_wall_params)
    
    if @plantwall.save
      redirect_to swot_user_path(@user)
    else
      render :new
    end 
  end
 
  def edit

  end

  def update
    if @wall.update(plant_wall_params)
      redirect_to root_path
    else
      render :edit
    end

  end

  def destroy
  	@wall.destroy

  	redirect_to root_path

  end

  private
    def current_user
    	@user = SwotUser.find(params[:swot_user_id])
    end

    def current_wall
      @wall = PlantWall.find(params[:id])
    end

    def plant_wall_params
    	params.require(:plant_wall).permit(:name, :location)
    end
end
