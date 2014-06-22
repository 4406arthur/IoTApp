module SwotUserHelper
  def swot_gravatar_for(swot_user, options = {size: 50})
    swot_gravatar_id = swot_user.fb_id
    size = options[:size]
    swot_gravatar_url ="https://secure.gravatar.com/avatar/#{swot_gravatar_id}?s=#{size}"
    image_tag(swot_gravatar_url, alt: swot_user.name, class: "gravatar")
  end

  def swot_sign_in(user)
    self.swot_current_user = user
  end

  def swot_signed_in?
    !swot_current_user.nil?
  end


  def swot_current_user=(user)
    @swot_current_user = user
  end

  def swot_current_user
    @swot_current_user ||= SwotUser.find_by(fb_id: session[:fb_id])
  end

  def swot_current_user?(user)
    user == swot_current_user
  end
  
  def swot_signed_in_user
    unless swot_signed_in?
      store_location
      redirect_to signin_url, notice: "wrong SWOT member" 
    end
  end

  def swot_sign_out
      self.swot_current_user = nil
      reset_session
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
 
end
