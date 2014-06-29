class SwotUser < ActiveRecord::Base
  has_many :devices, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  self.primary_key = "fb_id"
  def feed
    Suggestion.where("swot_user_id = ?", id)
  end


end
