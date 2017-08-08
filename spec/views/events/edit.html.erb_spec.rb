require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, FactoryGirl.create(:event, :with_3_departments))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "select#event_event_type[name=?]", "event[event_type]"

      assert_select "input#event_started_at[name=?]", "event[started_at]"

      assert_select "input#event_ended_at[name=?]", "event[ended_at]"

      assert_select "select#event_user_id[name=?]", "event[user_id]"

      assert_select "input#event_organizer[name=?]", "event[organizer]"

      assert_select "textarea#event_description[name=?]", "event[description]"

    end
  end
end
