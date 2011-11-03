require 'spec_helper'

describe "players/new.html.erb" do
  before(:each) do
    assign(:player, stub_model(Player,
      :mnfname => "MyString",
      :fname => "MyString",
      :lname => "MyString",
      :img => "MyString",
      :active => false,
      :profile => "MyText"
    ).as_new_record)
  end

  it "renders new player form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => players_path, :method => "post" do
      assert_select "input#player_mnfname", :name => "player[mnfname]"
      assert_select "input#player_fname", :name => "player[fname]"
      assert_select "input#player_lname", :name => "player[lname]"
      assert_select "input#player_img", :name => "player[img]"
      assert_select "input#player_active", :name => "player[active]"
      assert_select "textarea#player_profile", :name => "player[profile]"
    end
  end
end
