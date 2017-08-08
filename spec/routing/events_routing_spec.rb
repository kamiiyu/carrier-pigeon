require "rails_helper"

RSpec.describe EventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/events").to route_to("events#index")
      expect(:get => "/events/event_type/Training").to route_to("events#index", event_type: 'Training')
      expect(:get => "/events/event_type/Outing").to route_to("events#index", event_type: 'Outing')
      expect(:get => "/events/event_type/Others").to route_to("events#index", event_type: 'Others')
    end

    it "routes to #new" do
      expect(:get => "/events/new").to route_to("events#new")
    end

    it "routes to #show" do
      expect(:get => "/events/1").to route_to("events#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/events/1/edit").to route_to("events#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/events").to route_to("events#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/events/1").to route_to("events#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/events/1").to route_to("events#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/events/1").not_to be_routable
    end

    it "routes to #send_email" do
      expect(:get => "/events/1/send_email").to route_to("events#send_email", :id => "1")
    end

    it "routes to #enroll_by_email" do
      expect(:get => "/events/enroll_by_email?token=header.test.fotter").to route_to("events#enroll_by_email", token: 'header.test.fotter')
    end

  end
end
