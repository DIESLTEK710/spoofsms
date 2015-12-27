class SmsMailer < ApplicationMailer
  default :from => "no-reply@youspoof.us"

  def confirmation(spoof_id)
      @spoof = Spoof.find(spoof_id)
      mail to: [@spoof.user.email], subject: "You've sent a spoof!"
  end
end
