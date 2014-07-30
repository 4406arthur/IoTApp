class DevicesController < ApplicationController
  before_action :current_wall, except: :destroy
  def new  
  end

  def create
    Device.create(:device_id => params[:dev_id], :gw_id => params[:gw_id] ,:plant_wall_id => params[:plant_wall_id],:name => params[:name], :category => params[:catelog] )
    render :nothing => true
  end
  
  def index
    @devices = @wall.devices
  end

  def chart
    @devices = @wall.devices
    #render json: current_user.devices.group(:name).group_by_day(:created_at).count.chart_json
  end

  def pic
    @images = Dir.glob("app/assets/images/slide/"+@wall.id.to_s()+"/*.jpg")
  end

  def cam
    
  end



  def destroy
    
    
    @device = Device.find([ params[:id],session[:gw_id] ])
    @wall = @device.plant_wall
    @device.destroy

    respond_to do |format|
      format.html { redirect_to plant_wall_devices_path(@wall), notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
      format.js 
    end
  end

  private 
    def current_wall
      @wall = PlantWall.find(params[:plant_wall_id])
    end
  
end
