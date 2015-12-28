class QuotaMailer < ApplicationMailer
  default :from => "no-reply@youspoof.us"

  def quota_reset(quotum_id)
      @quotum = Quotum.find(quotum_id)
      mail to: [@quotum.user.email], subject: "Your spoof quota has been reset!"
  end
end
