require 'rake'
namespace :quota do
  desc "Reset user quotas and Send email"
  task reset: :environment do
    Quotum.all.each do |q|
      q.update(sum: "0")
      QuotaMailer.quota_reset(q.id).deliver
    end
  end
end
