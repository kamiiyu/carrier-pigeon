require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :name => "Name",
        :eventalization => nil,
        :location => "Location",
        :fee => 2.5,
        :user => nil,
        :capacity => 3,
        :description => "MyText",
        :feedback_template => "MyText",
        :tags => "",
        :status => "Status"
      ),
      Event.create!(
        :name => "Name",
        :eventalization => nil,
        :location => "Location",
        :fee => 2.5,
        :user => nil,
        :capacity => 3,
        :description => "MyText",
        :feedback_template => "MyText",
        :tags => "",
        :status => "Status"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
