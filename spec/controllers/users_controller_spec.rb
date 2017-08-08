require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_session) { {} }
  let(:published_event) { FactoryGirl.create(:event, :published) }
  let(:vince) { FactoryGirl.create(:user, :vince) }

  login_user

  def logout_user
    sign_out controller.current_user
  end

  describe "POST #enroll" do
    it "should enrolled" do
      expect(published_event.enrolled_users.count).to eq 0
      post :enroll, params: {event_id: published_event.id, id: vince.id}, session: valid_session, format: :js
      expect(published_event.enrolled_users.count).to eq 1
      expect(published_event.enrolled_users.first).to eq vince
    end
  end
  
end
