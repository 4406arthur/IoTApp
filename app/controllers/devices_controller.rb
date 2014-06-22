class DevicesController < ApplicationController
  def new
    user = SwotUser.create(:fb_id => session[:fb_id], :gw_id => session[:gw_id])
    dev = Device.new(:device_id => params[:dev_id],:swot_user =>user,:name => params[:name])
    if (dev.save)
      render :text => "ok"
    else
      flash.now[:error] = 'error creation'
    end
  end
  
end
