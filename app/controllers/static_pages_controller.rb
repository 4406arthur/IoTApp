class StaticPagesController < ApplicationController
	def home
      if signed_in?
        @micropost  = current_user.microposts.build if signed_in?
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    end

    def check
     if SwotUser.where( :fb_id => params[:fb_id] ).first != nil
        render :text => "user pass"
     else
        #render :text => "have to subcribe service"
        session[:fb_id]= params[:fb_id]
        session[:gateway_id] = params[:gateway_id]
        redirect_to :action => "home"
     end
    end
	
	def help
	end

	def about
	end
end
