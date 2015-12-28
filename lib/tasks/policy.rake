require 'rake'
namespace :policy do
  desc "Send Updated Terms of Service"
  task tos: :environment do
  end

  desc "Send Updated Acceptable Use Policy"
  task aup: :environment do
      User.all.each do |u|
        PolicyMailer.acceptable_use_policy(u.id).deliver
      end
  end

  desc "Send Updated Privacy Policy"
  task aup: :environment do
  end
end
