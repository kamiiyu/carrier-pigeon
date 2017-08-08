require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, FactoryGirl.create(:event))
  end

  it "renders attributes in <p>" do
    render @event
    expect(rendered).to match(/Event 1/)
    expect(rendered).to match(/Training/)
  end

end
