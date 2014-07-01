class DevicesController < ApplicationController
  before_action :correct_user
  def new
    @user = SwotUser.where(:fb_id => session[:fb_id])
    if @user
      dev = Device.create(:device_id => params[:dev_id],:swot_user =>@user.first,:name => params[:name])
      flash[:sucess] = "subcribe success"
      render :nothing => true
    else
      new_user = SwotUser.create(:fb_id => session[:fb_id], :gw_id => session[:gw_id])
      dev = Device.create(:device_id => params[:dev_id],:swot_user =>new_user,:name => params[:name])
      render :nothing => true
    end
  end
  
  def show
    @devices = @user.first.devices
  end

  private 
    def correct_user
      @user = SwotUser.where(:fb_id => session[:fb_id])
    end
  
end
