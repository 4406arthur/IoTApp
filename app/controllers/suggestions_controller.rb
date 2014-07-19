class SuggestionsController < ApplicationController
before_action :swot_signed_in_user
before_action :correct_user, only: :destroy
  def create
    @suggestion = swot_current_user.suggestions.build(suggestion_params)
    if @suggestion.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  	@suggestion.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
      format.js 
    end
  end

  private

    def suggestion_params
      params.require(:suggestion).permit(:content)
    end

    def correct_user
      @suggestion = swot_current_user.suggestions.find_by(id: params[:id])
      redirect_to root_url if @suggestion.nil?
    end
end
