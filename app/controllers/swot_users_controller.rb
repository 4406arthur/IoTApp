class SwotUsersController < ApplicationController
  before_action :set_user_session
  before_action :current_user


  def show
    if !current_user
      @new_user = SwotUser.create(:gw_id => session[:gw_id], :fb_id => session[:fb_id])
      render 'shared/update_info'
    else
      @plant_walls= @user.plant_walls
    end
  end

  def edit
    @user = SwotUser.find(params[:id])
  end

  def update
    @user = SwotUser.find(params[:id])

    if @user.update(plant_wall_params)
      redirect_to swot_user_path(@user)
    else
      render :edit
    end
  end

  def new
  end

  
  def create
  end

  
  def destroy
  end

  def logout
    swot_sign_out
    redirect_to root_url
  end


  private

    def set_user_session
      if params[:gwid] && params[:fbid]
        session[:fb_id] = params[:fbid]
        session[:gw_id] = params[:gwid]
      else
        if !session[:fb_id] && !session[:gw_id]
          render :text => "Login Swot first"
        end
      end
    end

    def current_user
      @user = SwotUser.find_by(gw_id: session[:gw_id])
    end

    def plant_wall_params
      params.require(:swot_user).permit(:name,:email)
    end
end
