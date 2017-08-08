require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:event) { FactoryGirl.create(:event) }
  let(:user) { FactoryGirl.create(:user, :vince) }
  let(:mail) { UserMailer.event_announcement(event, user)}

  it 'renders the subject' do
    expect(mail.subject).to eq(event.name)
  end

  it 'renders the receiver email' do
    expect(mail.to).to eq([user.email])
  end

  it 'renders the sender email' do
    expect(mail.from).to eq([event.user.email])
  end

end
