# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def event_announcement
    UserMailer.event_announcement(Event.find(3))
  end

end
