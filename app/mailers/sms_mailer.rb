class SmsMailer < ApplicationMailer
  default :from => Rails.application.secrets.gmail_email

  def confirmation(spoof_id)
      @spoof = Spoof.find(spoof_id)
      mail to: [@spoof.user.email], subject: "You've sent a spoof!"
  end
end
