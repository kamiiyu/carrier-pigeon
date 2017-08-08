class UserMailer < ApplicationMailer
  def event_announcement(event, user = nil)
    mail_to = user.try(:full_email_address) || event.mail_to
    @event = event
    @user = user
    @body = event.description
    @body.scan(/\/ckeditor_assets\/(.*)\/(\d+)\/(.*?)"/).each do |asset|
      ck_asset = Ckeditor::Asset.find(asset[1])
      attachments.inline["#{ck_asset.id}_#{ck_asset.filename}"] = {mime_type: ck_asset.mime_type_from_mimemagic, content: File.read(ck_asset.path)}
    end
    @body.gsub!(/\/ckeditor_assets\/attachments.*"/){|att| "#{Settings.domain[Rails.env]}#{att}"}

    mail(to: mail_to, from: event.user.full_email_address , subject: event.name)
  end
end
