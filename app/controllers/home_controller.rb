class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @season = Season.current
    @post = Post.published.where(:season_id => @season).last
    @winners = Post.find(@post).users.where("score_id = 3")
    @losers = Post.find(@post).users.where("score_id = 1")
    @drawers = Post.find(@post).users.where("score_id = 2")
    @moms = Post.find(@post).users.where("mom = 1")
    @noshows = Post.find(@post).users.where("score_id = 4")
    @participants = User.joins(:participants => {:post => :season}).where("seasons.active = 1").select("distinct(users.id)")
  	@title = "Latest Match Report"
    
  end

end
