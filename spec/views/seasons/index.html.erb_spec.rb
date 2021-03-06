require 'spec_helper'

describe "seasons/index.html.erb" do
  before(:each) do
    assign(:seasons, [
      stub_model(Season,
        :name => "Name",
        :active => false,
        :notes => "MyText"
      ),
      stub_model(Season,
        :name => "Name",
        :active => false,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of seasons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
