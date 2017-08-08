require 'rails_helper'

RSpec.describe DepartmentsEvent, type: :model do
  describe 'DepartmentsEvent Associations' do
    it { should belong_to(:department) }
    it { should belong_to(:event) }
  end
end
