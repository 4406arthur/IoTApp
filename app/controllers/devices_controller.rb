class DevicesController < ApplicationController
  def new
    user = SwotUser.where(:fb_id => session[:fb_id])
    if user
      dev = Device.create(:device_id => params[:dev_id],:swot_user =>user.first,:name => params[:name])
      flash[:sucess] = "subcribe success"
      render :nothing => true
    else
      new_user = SwotUser.create(:fb_id => session[:fb_id], :gw_id => session[:gw_id])
      dev = Device.create(:device_id => params[:dev_id],:swot_user =>new_user,:name => params[:name])
      render :nothing => true
    end
  end
  
  def create
    user = SwotUser.find(:fb_id => session[:fb_id])
    device = user.Device.find(:device_id => params[:dev_id])
    #value
  end
  
end
