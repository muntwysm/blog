require 'spec_helper'

describe "players/show.html.erb" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :mnfname => "Mnfname",
      :fname => "Fname",
      :lname => "Lname",
      :img => "Img",
      :active => false,
      :profile => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mnfname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Img/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
