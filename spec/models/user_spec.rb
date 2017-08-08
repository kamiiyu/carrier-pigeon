require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Associations' do
    it { should belong_to(:department) }
    it { should have_many(:own_events) }
  end

  describe 'User scope' do
    context '#from_admin' do
      let(:dep3) { FactoryGirl.create(:department, id: 3) }
      let(:dep4) { FactoryGirl.create(:department, id: 4) }
      let(:user3) { FactoryGirl.create(:user, department_id: dep3.id )}
      let(:user4) { FactoryGirl.create(:user, department_id: dep4.id )}
      let(:users) { User.from_admin}
      it 'should get all users from Admin(department_id: 3)' do
        expect(users).to include user3
        expect(users).not_to include user4
      end
    end

    context '#active' do
      let(:department) { FactoryGirl.create(:department) }
      let(:user0) { FactoryGirl.create(:user, department_id: department.id, status: 0 )}
      let(:user1) { FactoryGirl.create(:user, department_id: department.id, status: 1 )}
      let(:users) { User.active}
      it 'should get all active users' do
        expect(users).to include user1
        expect(users).not_to include user0
      end
    end
  end

  describe 'User instance methods' do
    context '#display_name' do
      let(:user) { FactoryGirl.create(:user, :vince) }
      let(:display_name) { "[Dev]Vince" }
      it 'should show display_name' do
        expect(user.display_name).to eq display_name
      end
    end
  end
end
