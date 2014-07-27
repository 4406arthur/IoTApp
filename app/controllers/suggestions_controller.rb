class SuggestionsController < ApplicationController
before_action :current_wall, except: :destroy

  def create
    @suggestion = @wall.suggestions.build(suggestion_params)
    if @suggestion.save
      flash[:success] = "suggestion created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])
    @wall = @suggestion.plant_wall
  	@suggestion.destroy
    respond_to do |format|
      format.html { redirect_to plant_wall_suggestions_path(@wall) }
      format.json { head :no_content }
      format.js 
    end
  end

  def index
    @feed_items = @wall.feed.paginate(page: params[:page])
  end

  private

    def suggestion_params
      params.require(:suggestion).permit(:content)
    end

    def current_wall
      @wall = PlantWall.find(params[:plant_wall_id])
    end
end
