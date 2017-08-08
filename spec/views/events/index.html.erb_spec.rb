require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, Kaminari.paginate_array(FactoryGirl.create_list(:event, 2, :index)).page(1))
  end

  it "renders a list of events" do
    allow(view).to receive(:policy).and_return(double(create?: true))
    render
    assert_select "tr>td", :text => "Event 1".to_s, :count => 2
    assert_select "tr>td", :text => "Training".to_s, :count => 2
    assert_select "tr>td", :text => '2016-12-31 16:00:00', :count => 2
    assert_select "tr>td", :text => '2017-01-01 16:00:00', :count => 2
    assert_select "tr>td", :text => 'Draft', :count => 2
    assert_select "tr>td", :text => 'Training', :count => 2
  end

  it "renders a [Create] button" do
    allow(view).to receive(:policy).and_return(double(create?: true))
    render
    assert_select "a", text: 'Create', :count => 1
  end

  it "does not render a [Create] button" do
    allow(view).to receive(:policy).and_return(double(create?: false))
    render
    assert_select "a", text: 'Create', count: 0
  end
end
