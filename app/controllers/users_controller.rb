class UsersController < ApplicationController
	before_filter :authenticate_user!
	
  def index
    @users = User.current.where(:active => true).order("mnfname ASC")
  	@season = Season.where(:active => true).first
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @seasons = Season.all
  	@season = Season.where(:active => true).first
  end
end
