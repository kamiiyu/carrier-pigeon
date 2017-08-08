require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do

    it "routes to #enroll" do
      expect(:post => "/events/1/users/2/enroll").to route_to("users#enroll", event_id: "1", :id => "2")
    end

  end
end
