class SessionsController < ApplicationController
  def destroy
  	swot_sign_out
    redirect_to root_url
  end
end
