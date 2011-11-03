class PagesController < ApplicationController
	before_filter :authenticate_user!
	
  def rankings
  	@users = User.current
  	@participants = User.joins(:participants => {:post => :season}).where("seasons.active = 1").select("distinct(users.id)")
  	@season = Season.current
  end

  def champions
  	@users = User.current
  	@season = Season.current
  end
  
end
