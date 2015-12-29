class UserMailer < ApplicationMailer
  default :from => "no-reply@youspoof.us"

  def reminder(user_id)
      @user = User.find(user_id)
      mail to: [@user.email], subject: "You haven't confirmed your email address"
  end

  def we_miss_you(user_id)
      @user = User.find(user_id)
      mail to: [@user.email], subject: "YouSpoof.us misses you!"
  end
end
