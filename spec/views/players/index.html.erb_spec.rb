require 'spec_helper'

describe "players/index.html.erb" do
  before(:each) do
    assign(:players, [
      stub_model(Player,
        :mnfname => "Mnfname",
        :fname => "Fname",
        :lname => "Lname",
        :img => "Img",
        :active => false,
        :profile => "MyText"
      ),
      stub_model(Player,
        :mnfname => "Mnfname",
        :fname => "Fname",
        :lname => "Lname",
        :img => "Img",
        :active => false,
        :profile => "MyText"
      )
    ])
  end

  it "renders a list of players" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mnfname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Img".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
