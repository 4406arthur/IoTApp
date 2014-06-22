class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_filter :set_access
  protect_from_forgery with: :exception
  include SwotUserHelper

end
