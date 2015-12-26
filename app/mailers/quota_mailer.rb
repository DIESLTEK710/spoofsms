class QuotaMailer < ApplicationMailer
  default :from => Rails.application.secrets.gmail_email

  def quota_reset(user_id)
      @user = User.find(user_id)
      mail to: [@user.email], subject: "Your spoof quota has been reset!"
  end
end
