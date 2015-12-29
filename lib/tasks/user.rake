require 'rake'
namespace :user do
  desc "Remind user to confirm email address"
  task confirm: :environment do
    User.unconfirmed.each do |u|
      UserMailer.reminder(u.id).deliver
    end
  end

  desc "Remind user to login"
  task remind: :environment do
      User.lapse_in_login.each do |u|
        UserMailer.reminder(u.id).deliver
      end
  end
end
