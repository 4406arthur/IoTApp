class DevicesController < ApplicationController
  before_action :current_user, only:[:show, :chart] 
  def new
    if SwotUser.exists?(:fb_id => session[:fb_id])
      user = SwotUser.find_by(fb_id: session[:fb_id], gw_id: session[:gw_id])
      Device.create(:device_id => params[:dev_id],:swot_user =>user,:name => params[:name])
      flash[:sucess] = "subcribe success"
      render :nothing => true
    else
      user = SwotUser.create(:fb_id => session[:fb_id], :gw_id => session[:gw_id])
      Device.create(:device_id => params[:dev_id],:swot_user => user,:name => params[:name])
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

  private 
    def current_user
      currnet_user = SwotUser.find_by(fb_id: session[:fb_id])
    end
  
end
