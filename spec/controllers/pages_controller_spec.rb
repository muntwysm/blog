require 'spec_helper'

describe PagesController do

  describe "GET 'rankings'" do
    it "should be successful" do
      get 'rankings'
      response.should be_success
    end
  end

  describe "GET 'champions'" do
    it "should be successful" do
      get 'champions'
      response.should be_success
    end
  end

end
