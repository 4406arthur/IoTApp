class StaticPagesController < ApplicationController
#include SwotUserHelper
  def home
    if swot_signed_in?
       @suggestion = swot_current_user.suggestions.build if swot_signed_in?
       @feed_items = swot_current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

end
