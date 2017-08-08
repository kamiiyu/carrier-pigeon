require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Event Attributes' do
    subject { Event.new }
    its(:status) { should eq 'draft' }
  end

  describe 'Event Associations' do
    it { should have_many(:departments_events) }
    it { should have_many(:departments).through(:departments_events) }
    it { should belong_to(:user) }
    it { should belong_to(:owner) }
  end

  describe 'Event Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of(:started_at) }
    it { should validate_presence_of(:ended_at) }
    it { should validate_presence_of(:enrollment_ended_at) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:departments) }
    it 'fails validation when enrollment_started_at > enrollment_ended_at' do
      expect(FactoryGirl.build(:event, :invalid_enrollment_date)).to be_invalid
    end
  end



  context 'Event instance method' do
    describe '#converted_description ' do
      context 'convertable' do
        subject { FactoryGirl.create(:event, :convertable, :with_3_departments) }
        its(:converted_description) { should eq "descriptions #{subject.started_at}" }
      end

      context 'unconvertable' do
        subject { FactoryGirl.create(:event, :unconvertable, :with_3_departments) }
        its(:converted_description) { should eq 'descriptions #{no_method}' }
      end

      context 'not_in_whitelist' do
        subject { FactoryGirl.create(:event, :not_in_whitelist, :with_3_departments) }
        its(:converted_description) { should eq 'descriptions #{id}' }
      end
    end

    describe '#status?' do
      context 'Published' do
        subject {FactoryGirl.create(:event, :published)}
        its(:published?) { should eq true }
        its(:draft?) { should eq false }
      end

      context 'Draft' do
        subject {FactoryGirl.create(:event, :draft)}
        its(:published?) { should eq false }
        its(:draft?) { should eq true }
      end

      context 'Unknow status' do
        let(:event) {FactoryGirl.create(:event, :draft)}
        it 'should raise NoMethodError' do
          expect{event.unknow?}.to raise_error(NoMethodError)
        end
      end
    end
  end

end
