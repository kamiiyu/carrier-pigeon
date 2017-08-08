require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
  describe "#publish_caption" do
    context 'Draft Event' do
      it "should show [Published]" do
        @event = assign( :event, FactoryGirl.create(:event, :draft) )
        expect(helper.publish_caption).to eq("Publish & Send email")
      end
    end

    context 'Published Event' do
      it "should show [Unpublished]" do
        @event = assign( :event, FactoryGirl.create(:event, :published) )
        expect(helper.publish_caption).to eq("Unpublish")
      end
    end
  end

  describe "#event_status" do
    context 'Draft Event' do
      it "should show [Published]" do
        @event = assign( :event, FactoryGirl.create(:event, :draft) )
        expect(helper.event_status).to eq("published")
      end
    end

    context 'Published Event' do
      it "should show [Unpublished]" do
        @event = assign( :event, FactoryGirl.create(:event, :published) )
        expect(helper.event_status).to eq("draft")
      end
    end
  end

  describe "#panel_type" do
    context 'Draft Event' do
      it "should show red panel" do
        @event = assign( :event, FactoryGirl.create(:event, :draft) )
        expect(helper.panel_type).to eq("panel panel-red")
      end
    end

    context 'Published Event' do
      it "should show green panel" do
        @event = assign( :event, FactoryGirl.create(:event, :published) )
        expect(helper.panel_type).to eq("panel panel-green")
      end
    end
  end
end
