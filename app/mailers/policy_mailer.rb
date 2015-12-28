class PolicyMailer < ApplicationMailer
  default :from => "no-reply@youspoof.us"

  def acceptable_use_policy(user_id)
      @user = User.find(user_id)
      mail to: [@user.email], subject: "Update to our Acceptable Use Policy"
  end
end
