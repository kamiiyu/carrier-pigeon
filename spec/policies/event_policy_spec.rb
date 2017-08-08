require 'rails_helper'

RSpec.describe EventPolicy do

  let(:admin) { FactoryGirl.create(:user, :alex) }
  let(:not_admin) { FactoryGirl.create(:user, :vince) }
  let(:dev_user) { FactoryGirl.create(:user, :dev) }
  let(:qa_user) { FactoryGirl.create(:user, :qa1) }
  let(:published_event) { FactoryGirl.create(:event, :published) }
  let(:draft_event) { FactoryGirl.create(:event, :draft) }
  let(:dev_published_event) { FactoryGirl.create(:event, :dev, departments: [dev_user.department], status: 'published') }
  let(:dev_draft_event) { FactoryGirl.create(:event, :dev, departments: [dev_user.department], status: 'draft') }

  describe 'Permissions on pages' do
    subject { described_class }

    permissions ".scope" do
      context 'admin users' do
        it 'return all events' do
          expect(EventPolicy::Scope.new(admin, Event.all).resolve).to include(published_event)
          expect(EventPolicy::Scope.new(admin, Event.all).resolve).to include(draft_event)
        end
      end

      context 'event owner' do
        it 'return own draft events' do
          expect(EventPolicy::Scope.new(draft_event.owner, Event.all).resolve).to include(draft_event)
        end
      end

      context 'not admin users' do
        it 'return published events only' do
          expect(EventPolicy::Scope.new(not_admin, Event.all).resolve).to include(published_event)
          expect(EventPolicy::Scope.new(not_admin, Event.all).resolve).not_to include(draft_event)
        end
      end
    end

    permissions :new?, :create? do
      it 'grants access if is admin' do
        expect(subject).to permit(admin)
      end

      it 'denies access if is not admin' do
        expect(subject).not_to permit(not_admin)
      end
    end

    permissions :edit?, :update?, :send_email? do
      it 'grants access if is admin' do
        expect(subject).to permit(admin)
      end

      it 'grants access if is event owner' do
        expect(subject).to permit(published_event.owner, published_event)
        expect(subject).to permit(draft_event.owner, draft_event)
      end

      it 'denies access if is not admin' do
        expect(subject).not_to permit(not_admin)
      end
    end

    permissions :show? do
      context 'published events' do
        it 'grants to all login user' do
          expect(subject).to permit(admin, published_event)
          expect(subject).to permit(not_admin, published_event)
        end
      end

      context 'draft events' do
        it 'grants to admin or event owner' do
          expect(subject).to permit(admin, draft_event)
          expect(subject).to permit(draft_event.owner, draft_event)
          expect(subject).not_to permit(not_admin, draft_event)
        end
      end
    end

    permissions :enroll? do
      context 'published events' do
        it 'grants to admin & invited user' do
          expect(subject).to permit(admin, dev_published_event)
          expect(subject).to permit(dev_user, dev_published_event)
          expect(subject).not_to permit(qa_user, dev_published_event)
        end
      end

      context 'unpublished events' do
        it 'does not grants to anyone' do
          expect(subject).not_to permit(admin, dev_draft_event)
          expect(subject).not_to permit(dev_user, dev_draft_event)
          expect(subject).not_to permit(qa_user, dev_draft_event)
        end
      end
    end

  end

end
