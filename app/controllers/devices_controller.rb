class DevicesController < ApplicationController
  before_action :current_user
  def new
    if SwotUser.exists?(:fb_id => session[:fb_id])
      user = SwotUser.find_by(fb_id: session[:fb_id], gw_id: session[:gw_id])
      Device.create(:device_id => params[:dev_id],:swot_user_id => params[:swot_user],:name => params[:name])
      flash[:sucess] = "subcribe success"
      render :nothing => true
    else
      user = SwotUser.create(:fb_id => session[:fb_id], :gw_id => session[:gw_id])
      Device.create(:device_id => params[:dev_id],:swot_user_id => params[:swot_user],:name => params[:name])
      render :nothing => true
    end
  end
  
  def show
    @devices = current_user.devices
  end

  def chart
    @devices = current_user.devices
    #render json: current_user.devices.group(:name).group_by_day(:created_at).count.chart_json
  end

  def pic
    @images = Dir.glob("app/assets/images/slide/*.jpg")
  end

  def cam
    
  end



  def destroy
    #@swot_user =SwotUser.find(params[:swot_user_id])
    @device = Device.find_by( swot_user_id: params[:swot_user_id], device_id: params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to '/devices', notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
      format.js 
    end
  end

  private 
    def current_user
      currnet_user = SwotUser.find_by(fb_id: session[:fb_id])
    end
  
end
