class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: "mnf", password: "admin"
  before_filter :authenticate_user!
  
  def index
  end
  
end
