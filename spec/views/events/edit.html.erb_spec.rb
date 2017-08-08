require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "MyString",
      :eventalization => nil,
      :location => "MyString",
      :fee => 1.5,
      :user => nil,
      :capacity => 1,
      :description => "MyText",
      :feedback_template => "MyText",
      :tags => "",
      :status => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_eventalization_id[name=?]", "event[eventalization_id]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_fee[name=?]", "event[fee]"

      assert_select "input#event_user_id[name=?]", "event[user_id]"

      assert_select "input#event_capacity[name=?]", "event[capacity]"

      assert_select "textarea#event_description[name=?]", "event[description]"

      assert_select "textarea#event_feedback_template[name=?]", "event[feedback_template]"

      assert_select "input#event_tags[name=?]", "event[tags]"

      assert_select "input#event_status[name=?]", "event[status]"
    end
  end
end
