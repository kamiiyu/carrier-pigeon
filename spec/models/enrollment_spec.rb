require 'rails_helper'

RSpec.describe Enrollment, type: :model do

  describe 'Enrollment Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end

  describe 'Event Validations' do
    let(:vince) { FactoryGirl.create(:user, :vince) }
    let(:event_out_of_date) { FactoryGirl.create(:event, :enrollment_out_of_date) }
    it 'fails validation when current date > enrollment_ended_at' do
      expect(FactoryGirl.build(:enrollment, user: vince, event: event_out_of_date)).to be_invalid
    end
  end
end
