class SwotUsersController < ApplicationController
  before_action :swot_signed_in_user, only:[:index]
  before_action :swot_correct_user,   only: [:edit, :update]
  
  def check
    user = SwotUser.find_by(fb_id: params[:fbid] )
    if user
       session[:fb_id]= params[:fbid]
       session[:gw_id] = params[:gwid]  
       swot_sign_in user
       redirect_to user
    else
       #render :text => "have to subcribe service"
       session[:fb_id]= params[:fbid]
       session[:gw_id] = params[:gwid]
       redirect_to "http://140.138.150.57"
    end
  end

  def index
    @users = SwotUser.paginate(page: params[:page])
  end
  
  def show
    @user = SwotUser.find(params[:id])
    @suggestions = @user.suggestions.paginate(page: params[:page])
    #swot_sign_in @user
  end

  # GET /users/new
  def new
    @user = SwotUser.new  
  end

  # GET /users/1/edit
  def edit
    @user = SwotUser.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = SwotUser.new(fb_id: session[fb_id], gw_id: session[gw_id])    # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the PlantFactory App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = SwotUser.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    SwotUser.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def admin_user
      redirect_to(root_url) unless swot_current_user.admin?
    end

    def user_params
      params.require(:swot_user).permit(:name )
    end
    # Before filters

    def swot_signed_in_user
      unless swot_signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def swot_correct_user
      @user = SwotUser.find(params[:id])
      redirect_to(root_url) unless swot_current_user?(@user)
    end
end
